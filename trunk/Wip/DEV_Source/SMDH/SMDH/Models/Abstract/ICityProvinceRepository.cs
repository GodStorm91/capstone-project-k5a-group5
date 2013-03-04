using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface ICityProvinceRepository
    {
        IQueryable<CityProvince> CityProvinces { get; set; }

        CityProvince Find(int id);
        List<CityProvince> GetAllCityProvinces();
        void Add(CityProvince cityProvince);
        void Save(CityProvince cityProvince);
        void Remove(int id);
        int GetMaximumRequestsOfCity(int cityId);
        void DisplayOrder(int? displayOrder, int cityId);

    }
}
