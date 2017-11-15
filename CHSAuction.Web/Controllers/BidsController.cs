using CHSAuction.Entities;
using CHSAuction.Web.DataContexts;
using CHSAuction.Web.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CHSAuction.Web.Controllers
{
    public class BidsController : Controller
    {
        CHSAuctionDb _db = new CHSAuctionDb();
        IdentityDb _idb = new IdentityDb();

        [Authorize]
        public ActionResult BidHistory(int itemId)
        {
            string userId = User.Identity.GetUserId();

            var myBids = from b in _db.ItemBids
                         //join u in _db.UserProfiles
                         //on b.UserId equals u.UserId
                         where b.ItemId == itemId
                         where b.UserId == userId
                         orderby b.Bid descending
                         select b.Bid;

            if (myBids.Any())
                return Content("$" + string.Join(", $", myBids));
            else
                return Content("None");
        }

        [Authorize]
        public ActionResult Index([Bind(Prefix = "id")] int itemId)
        {
   
            var allItemsBidHistory = _db.Items.GroupJoin(_db.ItemBids,
                        i => i.Id,
                        ib => ib.ItemId,
                        (x, y) => new { Items = x, ItemBids = y })
                        .SelectMany(
                            x => x.ItemBids.DefaultIfEmpty(),
                            (x, y) => new { Items = x.Items, ItemBids = y })
                            .Where(i => i.Items.Id == itemId);

            var model = allItemsBidHistory.Select(i => new
            {
                Id = i.Items.Id,
                Name = i.Items.Name,
                Description = i.Items.Description,
                Image = i.Items.Image,
                Value = i.Items.Value,
                MinimumBid = i.Items.MinimumBid,
                NewBid = (int?)i.ItemBids.Bid ?? 0,  // ItemListViewModel
                //MyBid = (int?)i.ItemBids.Bid ?? 0,
                HighestBid = (int?)i.Items.Bids.Max(b => b.Bid) ?? 0,  // ItemListViewModel
                //HighestBid = (int?)i.Items.ItemBids.Max(b => b.Bid) ?? 0,
                UserId = i.ItemBids.UserId
                //}).OrderByDescending(i => i.MyBid);
                //}).GroupBy(i => i.Name); //.OrderByDescending(i => i.MyBid);
            }).OrderBy(i => i.Id).ThenByDescending(i => i.NewBid);

            //if (bidsByUser.Count() > 0)
            if(model.Count() > 0)
            {

                //var result = bidsByUser.OrderBy(i => i.ItemName).ThenBy(i => i.Description).ThenByDescending(i => i.Bid);
                //var result = bidsByUser.Select(b => new BidListViewModel
                var result = model.Select(r => new BidListViewModel
                {
                    UserId = r.UserId,
                    UserName = r.Name,
                    ItemId = r.Id,
                    ItemName = r.Name,
                    Description = r.Description,
                    Image = r.Image,
                    Value = r.Value,
                    MinimumBid = r.MinimumBid,
                    Bid = r.NewBid
                });

                if (result != null)
                    return View(result);
            }
            else
            {
                var result = model.Select(r => new BidListViewModel
                {
                    UserId = null,
                    UserName = null,
                    ItemId = r.Id,
                    ItemName = r.Name,
                    Description = r.Description,
                    Image = r.Image,
                    Value = r.Value,
                    MinimumBid = r.MinimumBid,
                    Bid = null
                });

                if (result != null)
                    return View(result);
            }
            return HttpNotFound();
        }
        // GET: Bids/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Bids/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult Create(int itemId)
        {
            var allBids = from b in _db.ItemBids
                          join i in _db.Items
                          on b.ItemId equals i.Id
                          where i.Id == itemId
                          orderby b.Bid descending
                          select b;

            var minumItemBid = from i in _db.Items
                               where i.Id == itemId
                               select i;

            int highestBid = allBids.Any() ? Math.Max(allBids.First().Bid, minumItemBid.First().MinimumBid) : minumItemBid.First().MinimumBid;

            //object userId = Membership.GetUser().ProviderUserKey;
            string userId = User.Identity.GetUserId();
            var myBid = new ItemBid();
            myBid.Bid = highestBid + 1;
            myBid.ItemId = itemId;
            myBid.UserId = userId;

            return View(myBid);
        }

        // POST: Bids/Create
        [HttpPost]
        [Authorize]
        // Obscure naming convention bug with EF - don't name parameters the same as model properties...
        // http://www.martin-brennan.com/net-mvc-4-model-binding-null-on-post/
        public ActionResult Create(ItemBid bidd)
        {
            var allBids = from b in _db.ItemBids
                          join i in _db.Items
                          on b.ItemId equals i.Id
                          where i.Id == bidd.ItemId
                          orderby b.Bid descending
                          select b;

            var minumItemBid = from i in _db.Items
                               where i.Id == bidd.ItemId
                               select i;

            int minumBid = allBids.Any() ? Math.Max(allBids.First().Bid, minumItemBid.First().MinimumBid) : minumItemBid.First().MinimumBid;

            // for this to work, make sure to set     @Html.ValidationSummary(false) in the Create.cshtml View
            if (bidd.Bid <= minumBid)
                ModelState.AddModelError("Bid", "Bid must be greater than $" + minumBid.ToString());
            else
                bidd.UserId = User.Identity.GetUserId();

            if (ModelState.IsValid)
            {
                _db.ItemBids.Add(bidd);
                _db.SaveChanges();
                //return RedirectToAction("Index", "Bids", new { id = bidd.ItemId });
                return RedirectToAction("Index", "Home");
            }
            return View(bidd);
        }

        // GET: Bids/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Bids/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Bids/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Bids/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
