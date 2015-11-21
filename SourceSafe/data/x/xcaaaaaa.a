using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public class PredefinedValidatorAttribute : ValidatorAttribute
    {
        // Fields
        private Type mEnumType;

        // Methods
        public PredefinedValidatorAttribute(Type enumType)
        {
            this.mEnumType = enumType;
        }

        public override bool IsValid()
        {
            Helper helper = new Helper();
            object obj2 = base.PropInfo.GetValue(base.Instance, null);
            if (!helper.IsNullOrEmpty(obj2) && !helper.IsDefinedName(this.EnumType, obj2))
            {
                base.mErrorMeg = helper.GetStringValue(NReasonError.Undefined_Element_Data);
                return false;
            }
            return true;
        }

        // Properties
        public Type EnumType
        {
            get
            {
                return this.mEnumType;
            }
        }
    }
}
