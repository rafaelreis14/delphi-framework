using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace TesteWeb
{
    public class Produto
    {
        [Display(Name="Código de Barras")]
        public string b1_codbar  {get;set;}
        [Display(Name = "Código")]
        public string b1_cod { get; set; }
        [Display(Name = "Descrição")]
        public string B1_DESC { get; set; }

        [Display(Name = "Ativo")]
        public string B1_ATVDA { get; set; }
        [Display(Name = "Tipo")]
        public string B1_TIPO { get; set; }

        public double preco { get; set; }
    }
}