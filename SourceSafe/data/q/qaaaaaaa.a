using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MicNets.BizLogic
{
    public class Keyword : IComparable
    {
        // Fields
        private int _count;
        private string _value;

        // Methods
        public Keyword(string value, int count)
        {
            this._count = count;
            this._value = value;
        }

        public int CompareTo(object obj)
        {
            Keyword keyword = (Keyword)obj;
            if (this.Count == keyword.Count)
            {
                return this.Value.CompareTo(keyword.Value);
            }
            return this.Count.CompareTo(keyword.Count);
        }

        // Properties
        public int Count
        {
            get
            {
                return this._count;
            }
            set
            {
                this._count = value;
            }
        }

        public string Value
        {
            get
            {
                return this._value;
            }
            set
            {
                this._value = value;
            }
        }
    }


}
