using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.Abstract
{
    interface IItemRepository
    {
         IQueryable<Item> Items { get; }


         bool Cancel(Item item);
         bool Cancel(Item item, bool commit);
         bool Delete(Item item);
         bool Delete(Item item, bool commit);    
        
    }
}