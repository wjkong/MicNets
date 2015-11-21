using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace MicNets.Model
{
    [Serializable]
    public class CustomerInfo
    {
        // Fields
        private NTaskCustomer _currentTask;
        private int _custID;
        private NRole _custRole;
        private DataTable _dtMenu;
        private string _email;
        private string _firstName;
        private string _langPrefer;
        private string _langUsing;
        private string _lastName;
        private string _password;
        private string _sessionID;
        private string _userName;

        // Properties
        public NTaskCustomer CurrentTask
        {
            get
            {
                return this._currentTask;
            }
            set
            {
                this._currentTask = value;
            }
        }

        public int CustID
        {
            get
            {
                return this._custID;
            }
            set
            {
                this._custID = value;
            }
        }

        public NRole CustRole
        {
            get
            {
                return this._custRole;
            }
            set
            {
                this._custRole = value;
            }
        }

        public DataTable DtMenu
        {
            get
            {
                return this._dtMenu;
            }
            set
            {
                this._dtMenu = value;
            }
        }

        public string Email
        {
            get
            {
                return this._email;
            }
            set
            {
                this._email = value;
            }
        }

        public string FirstName
        {
            get
            {
                return this._firstName;
            }
            set
            {
                this._firstName = value;
            }
        }

        public string LangPrefer
        {
            get
            {
                return this._langPrefer;
            }
            set
            {
                this._langPrefer = value;
            }
        }

        public string LangUsing
        {
            get
            {
                return this._langUsing;
            }
            set
            {
                this._langUsing = value;
            }
        }

        public string LastName
        {
            get
            {
                return this._lastName;
            }
            set
            {
                this._lastName = value;
            }
        }

        public string Password
        {
            get
            {
                return this._password;
            }
            set
            {
                this._password = value;
            }
        }

        public string SessionID
        {
            get
            {
                return this._sessionID;
            }
            set
            {
                this._sessionID = value;
            }
        }

        public string UserName
        {
            get
            {
                return this._userName;
            }
            set
            {
                this._userName = value;
            }
        }
    }


}
