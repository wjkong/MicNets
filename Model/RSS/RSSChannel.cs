using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace MicNets.Model.RSS
{
    public class RSSChannel
    {
        // Fields
        private string _dateLastUpdated;
        private string _datePublished;
        private string _description;
        private string _document;
        private string _generator;
        private RSSItem[] _items;
        private string _language;
        private string _link;
        private string _managingEditor;
        private string _title;
        private string _UpdateFrequence;
        private string _webMaster;

        // Properties
        [XmlElement("lastBuildDate")]
        public string DateLastUpdated
        {
            get
            {
                return this._dateLastUpdated;
            }
            set
            {
                this._dateLastUpdated = value;
            }
        }

        [XmlElement("pubDate")]
        public string DatePublished
        {
            get
            {
                return this._datePublished;
            }
            set
            {
                this._datePublished = value;
            }
        }

        [XmlElement("description")]
        public string Description
        {
            get
            {
                return this._description;
            }
            set
            {
                this._description = value;
            }
        }

        [XmlElement("docs")]
        public string Document
        {
            get
            {
                return this._document;
            }
            set
            {
                this._document = value;
            }
        }

        [XmlElement("generator")]
        public string Generator
        {
            get
            {
                return this._generator;
            }
            set
            {
                this._generator = value;
            }
        }

        public RSSItem[] Items
        {
            get
            {
                return this._items;
            }
            set
            {
                this._items = value;
            }
        }

        [XmlElement("language")]
        public string Language
        {
            get
            {
                return this._language;
            }
            set
            {
                this._language = value;
            }
        }

        [XmlElement("link")]
        public string Link
        {
            get
            {
                return this._link;
            }
            set
            {
                this._link = value;
            }
        }

        [XmlElement("managingEditor")]
        public string ManagingEditor
        {
            get
            {
                return this._managingEditor;
            }
            set
            {
                this._managingEditor = value;
            }
        }

        [XmlElement("title")]
        public string Title
        {
            get
            {
                return this._title;
            }
            set
            {
                this._title = value;
            }
        }

        [XmlElement("ttl")]
        public string UpdateFrequence
        {
            get
            {
                return this._UpdateFrequence;
            }
            set
            {
                this._UpdateFrequence = value;
            }
        }

        [XmlElement("webMaster")]
        public string WebMaster
        {
            get
            {
                return this._webMaster;
            }
            set
            {
                this._webMaster = value;
            }
        }
    }
}
