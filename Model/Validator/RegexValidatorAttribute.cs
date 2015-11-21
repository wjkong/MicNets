using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public class RegexValidatorAttribute : ValidatorAttribute
    {
        // Fields
        private NRegexType mRegexType;

        // Methods
        public RegexValidatorAttribute(NRegexType regexType)
        {
            this.mRegexType = regexType;
        }

        public override bool IsValid()
        {
            Helper helper = new Helper();
            object obj2 = base.PropInfo.GetValue(base.Instance, null);
            if (helper.IsNullOrEmpty(obj2))
            {
                return true;
            }
            switch (this.RegexType)
            {
                case NRegexType.Email:
                    if (helper.IsValidEmail(obj2.ToString()))
                    {
                        return true;
                    }
                    base.mErrorMeg = helper.GetStringValue(NReasonError.Email_Field);
                    return false;

                case NRegexType.Phone:
                    if (helper.IsValidPhone(obj2.ToString()))
                    {
                        return true;
                    }
                    base.mErrorMeg = helper.GetStringValue(NReasonError.Phone_Field);
                    return false;
            }
            return false;
        }

        // Properties
        public NRegexType RegexType
        {
            get
            {
                return this.mRegexType;
            }
        }
    }


}
