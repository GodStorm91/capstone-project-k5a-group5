

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using HDMS.Models.Statuses;

namespace HDMS.Models
{
[MetadataType(typeof(ItemMetadata))]
public partial class Item
{
    public bool Cancel(HDMSEntities context)
    {
        return Cancel(context, true);
    }

    public bool Cancel(HDMSEntities context, bool commit)
    {
        try
        {
            return Delete(context, commit);
        }
        catch (Exception e)
        {
            return false;
        }
    }

    public bool Delete(HDMSEntities context)
    {
        return Delete(context, true);
    }

    public bool Delete(HDMSEntities context, bool commit)
    {
        try
        {
            context.Items.Remove(this);
            if (commit) context.SaveChanges();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }
}

public partial class ItemMetadata
    {
  
    [DisplayName("Item Id")]
    [Required]
    public int ItemId { get; set; }	
  
    [DisplayName("Order Id")]
    [Required]
    public int OrderId { get; set; }	
  
    [DisplayName("Name")]
    [Required(ErrorMessage = "The Name of Item is required.")]
    [MaxLength(255)]
    public string Name { get; set; }	
  
    [DisplayName("Quantity")]
    [Required(ErrorMessage = "The Quantity is required.")]
    public int Quantity { get; set; }	
  
    [DisplayName("Is Fragile")]
    [Required]
    public bool IsFragile { get; set; }	
  
    [DisplayName("Has High Value")]
    [Required]
    public bool HasHighValue { get; set; }	
  
    [DisplayName("Size")]
    [Required(ErrorMessage = "The Size is required.")]
    [MaxLength(255)]
    public string Size { get; set; }	
  
    [DisplayName("Weight")]
    [Required(ErrorMessage = "The Weight is required.")]
    [MaxLength(255)]
    public string Weight { get; set; }	
  
    [DisplayName("Note")]
    public string Note { get; set; }	

  
    [DisplayName("Order")]
    public virtual Order Order { get; set; }	
    }
}

