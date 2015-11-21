using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public class CustomValidatorAttribute : ValidatorAttribute
    {
        // Fields
        private NCustomValidator customValidator;

        // Methods
        public CustomValidatorAttribute(NCustomValidator customValidator)
        {
            this.customValidator = customValidator;
        }

        public override bool IsValid()
        {
            Helper helper = new Helper();
            object obj2 = base.PropInfo.GetValue(base.Instance, null);
            return helper.IsNullOrEmpty(obj2);
        }
    }
}
