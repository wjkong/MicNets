using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public sealed class RequiredValidatorAttribute : ValidatorAttribute
    {
        // Methods
        public RequiredValidatorAttribute()
        {
            base.mErrorMeg = new Helper().GetStringValue(NReasonError.Mandatory_Field);
        }

        public override bool IsValid()
        {
            Helper helper = new Helper();
            return !helper.IsNullOrEmpty(base.PropInfo.GetValue(base.Instance, null));
        }
    }


}
