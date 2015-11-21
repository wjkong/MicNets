using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model.Validator
{
    [AttributeUsage(AttributeTargets.Property)]
    public abstract class ValidatorAttribute : Attribute
    {
        // Fields
        protected string mErrorMeg;
        private object mInstance;
        private PropertyInfo mPropInfo;

        // Methods
        protected ValidatorAttribute()
        {
        }

        public virtual bool IsValid()
        {
            return true;
        }

        // Properties
        public string ErrorMeg
        {
            get
            {
                return this.mErrorMeg;
            }
        }

        public object Instance
        {
            get
            {
                return this.mInstance;
            }
            set
            {
                this.mInstance = value;
            }
        }

        public PropertyInfo PropInfo
        {
            get
            {
                return this.mPropInfo;
            }
            set
            {
                this.mPropInfo = value;
            }
        }
    }


}
