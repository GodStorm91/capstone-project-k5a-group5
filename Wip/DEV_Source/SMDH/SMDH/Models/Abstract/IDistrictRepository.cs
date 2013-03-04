using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface IDistrictRepository
    {
        IQueryable<CityProvince> Districts { get; set; }

        District Find(int id);
        List<District> GetAllDistricts();
        void Add(District district);
        void Save(District district);
        void Remove(int id);
        int GetMaximumRequestsNumberOfDistrict(int districtId);
        void DisplayOrder(int? displayOrder, int cityId);
    }
}
