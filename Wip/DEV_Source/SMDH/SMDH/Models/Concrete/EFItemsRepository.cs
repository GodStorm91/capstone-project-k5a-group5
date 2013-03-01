﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;

namespace SMDH.Models.Concrete
{
    public class EFItemsRepository : IItemRepository
    {
        private EFDBbContext context = new EFDBbContext();

        public IQueryable<Item> Items
        {
            get { return context.Items;}
        }


        public bool Cancel(Item item)
        {
            return Cancel(item, true);
        }

        public bool Cancel(Item item, bool commit)
        {
            try
            {
                return Delete(item, commit);
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Delete(Item item)
        {
            return Delete(item, true);
        }

        public bool Delete(Item item, bool commit)
        {
            try
            {
                context.Items.Remove(item);
                if (commit) context.SaveChanges();
                return true;

            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
    }
}