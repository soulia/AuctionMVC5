using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHSAuction.Entities
{
    public class ItemBid
    {
        public int Id { get; set; }
        [Display(Name = "Minimum Bid")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public int Bid { get; set; }
        //public DateTime ts { get; set; }
        public int ItemId { get; set; }
        public string UserId { get; set; }
    }
}
