using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SiatdWeb.Models
{
    public class Produto
    {
        [Display(Name="Descrição")]
        public string Descricao { get; set; }
        [Display(Name="Preço")]
        [DataType(DataType.Currency)]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public string Preco { get; set; }       
    }
}