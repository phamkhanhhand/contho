using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CT.Models.Entity
{
    /// <summary>
    /// Employee
    /// </summary>
    /// phamkhanhhand 14.04.2023
    [EntityKey("employee_id", "adm_employee_seq")]
    [DatabaseViewName("adm_employee")]
    public class adm_Employee : BaseEntity
    {

        /// <summary>
        /// ID
        /// </summary>
        /// phamkhanhhand 05.07.2023
        public int employee_id { get; set; }
        /// <summary>
        /// Mã nhân viên
        /// </summary>
        /// phamkhanhhand 05.07.2023
        public string?  employee_code { get; set; }
        /// <summary>
        /// Tên nhân viên
        /// </summary>
        /// phamkhanhhand 05.07.2023
        public string employee_name { get; set; }
        public string? username { get; set; }
        public DateTime? created_date { get; set; }
         

    }
}
