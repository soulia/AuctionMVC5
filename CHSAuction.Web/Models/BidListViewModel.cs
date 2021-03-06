﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CHSAuction.Web.Models
{
    public class BidListViewModel
    {
        public string UserId { get; set; }
        [Display(Name = "Name")]
        public string UserName { get; set; }
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        [DisplayFormat(DataFormatString = "{0:c}")]
        public int Value { get; set; }
        [Display(Name = "Minimum")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public int MinimumBid { get; set; }
        [Display(Name = "Bid")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public int? Bid { get; set; }
    }
}