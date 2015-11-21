using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public class RangeValidatorAttribute : ValidatorAttribute
    {
        // Fields
        private object mMaximum;
        private object mMinimum;
        private Type mPropertyType;

        // Methods
        public RangeValidatorAttribute(Type propertyType)
        {
            this.mPropertyType = propertyType;
        }

        public RangeValidatorAttribute(Type propertyType, object minimum)
        {
            this.mPropertyType = propertyType;
            this.mMinimum = minimum;
        }

        public RangeValidatorAttribute(Type propertyType, object minimum, object maximum)
        {
            this.mPropertyType = propertyType;
            this.mMinimum = minimum;
            this.mMaximum = maximum;
        }

        public override bool IsValid()
        {
            Helper helper = new Helper();
            object obj2 = base.PropInfo.GetValue(base.Instance, null);
            if (!helper.IsNullOrEmpty(obj2))
            {
                if (this.PropertyType == typeof(int))
                {
                    if (!helper.IsWholeNumber(obj2.ToString()))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Integer_Field);
                        return false;
                    }
                    int num = Convert.ToInt32(obj2);
                    if (((this.Minimum != null) && helper.IsWholeNumber(this.Minimum.ToString())) && (num < Convert.ToInt32(this.Minimum)))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Value_LessThan_Minimum) + this.Minimum.ToString();
                        return false;
                    }
                    if (((this.Maximum != null) && helper.IsWholeNumber(this.Maximum.ToString())) && (num > Convert.ToInt32(this.Maximum)))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Value_GreaterThan_Maximum) + this.Maximum.ToString();
                        return false;
                    }
                    return true;
                }
                if (this.PropertyType == typeof(decimal))
                {
                    if (!helper.IsPositiveNumber(obj2.ToString()))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Decimal_Field);
                        return false;
                    }
                    decimal num2 = Convert.ToDecimal(obj2);
                    if (((this.Minimum != null) && helper.IsPositiveNumber(this.Minimum.ToString())) && (num2 < Convert.ToDecimal(this.Minimum)))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Value_LessThan_Minimum) + this.Minimum.ToString();
                        return false;
                    }
                    if (((this.Maximum != null) && helper.IsPositiveNumber(this.Maximum.ToString())) && (num2 > Convert.ToDecimal(this.Maximum)))
                    {
                        base.mErrorMeg = helper.GetStringValue(NReasonError.Value_GreaterThan_Maximum) + this.Maximum.ToString();
                        return false;
                    }
                    return true;
                }
                if (this.PropertyType != typeof(DateTime))
                {
                    return false;
                }
                if (!helper.IsDateTimeFormat(obj2.ToString()))
                {
                    base.mErrorMeg = helper.GetStringValue(NReasonError.Date_Field);
                    return false;
                }
                DateTime time = Convert.ToDateTime(obj2);
                if (((this.Minimum != null) && helper.IsDateTimeFormat(this.Minimum.ToString())) && (time < Convert.ToDateTime(this.Minimum)))
                {
                    base.mErrorMeg = "Date cannot be earlier than " + this.Minimum.ToString();
                    return false;
                }
                if (((this.Maximum != null) && helper.IsDateTimeFormat(this.Maximum.ToString())) && (time > Convert.ToDateTime(this.Maximum)))
                {
                    base.mErrorMeg = "Date cannot be later than " + this.Maximum.ToString();
                    return false;
                }
            }
            return true;
        }

        // Properties
        public object Maximum
        {
            get
            {
                return this.mMaximum;
            }
        }

        public object Minimum
        {
            get
            {
                return this.mMinimum;
            }
        }

        public Type PropertyType
        {
            get
            {
                return this.mPropertyType;
            }
        }
    }
}
