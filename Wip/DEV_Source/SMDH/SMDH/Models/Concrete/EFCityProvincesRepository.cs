using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;
namespace SMDH.Models.Concrete
{
    public class EFCityProvincesRepository : ICityProvinceRepository
    {
        private SMDHDataContext context = new SMDHDataContext();
        public IQueryable<CityProvince> CityProvinces
        {
            get
            {
                return context.CityProvinces;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        CityProvince ICityProvinceRepository.Find(int id)
        {
            throw new NotImplementedException();
        }

        public List<CityProvince> GetAllCityProvinces()
        {
            return context.CityProvinces.Where(o => o.IsActive == true).ToList();
        }

        public void Add(CityProvince cityProvince)
        {
            cityProvince.IsActive = true;
            if (cityProvince.DisplayOrder <= 0) cityProvince.DisplayOrder = 1;
            if (cityProvince.DisplayOrder > context.CityProvinces.Count()) cityProvince.DisplayOrder = context.CityProvinces.Count();
            context.CityProvinces.InsertOnSubmit(cityProvince);
            context.SubmitChanges();
            if (cityProvince.DisplayOrder != null) DisplayOrder(cityProvince.DisplayOrder, cityProvince.CityProvinceId);            
        }

        public void Save(CityProvince cityProvince)
        {
            if (cityProvince.DisplayOrder <= 0) cityProvince.DisplayOrder = 1;
            if (cityProvince.DisplayOrder <= 0) cityProvince.DisplayOrder = 1;
            if (cityProvince.DisplayOrder > context.CityProvinces.Count()) cityProvince.DisplayOrder = context.CityProvinces.Count();
            context.SubmitChanges();
            context.SubmitChanges();
            if (cityProvince.DisplayOrder != null) DisplayOrder(cityProvince.DisplayOrder, cityProvince.CityProvinceId);                        
            
            
        }

        public void Remove(int id)
        {
            var cityProvince = context.CityProvinces.Single(o => o.CityProvinceId == id);
            cityProvince.IsActive = false;
            foreach (var district in cityProvince.Districts)
            {
                district.IsActive = false;
                foreach (var ward in district.Wards)
                {
                    ward.IsActive = false;
                }
            }
            context.SubmitChanges();
        }
        

        public int GetMaximumRequestsOfCity(int cityId)
        {
            var requests = new List<Request>();
            var statuses = new List<int>();
            statuses.Add((int)RequestStatus.New);
            requests = context.Requests.Where(r => statuses.Contains(r.RequestStatus)).ToList();
            return requests.ToArray().Length;
        }

        public void DisplayOrder(int? displayOrder, int cityId)
        {
            if (displayOrder > 0)
            {
                var cities = context.CityProvinces;
                foreach (var eachCity in cities)
                {
                    if (eachCity.DisplayOrder >= displayOrder)
                    {
                        if (eachCity.CityProvinceId != cityId)
                        {
                            eachCity.DisplayOrder = eachCity.DisplayOrder + 1;
                        }
                    }
                }
            }
            context.SubmitChanges();
        }
    }
}