using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace MicNets.Model
{
    public class VideoInfo
    {
        // Fields
        private DateTime _dateTaken;
        private string _description;
        private string _location;
        private int _maxPageIndex;
        private int _pageIndex;
        private int _pageSize;
        private byte[] _thumbnail;
        private int _videoID;
        private string _youTubeCode;

        // Methods
        public VideoInfo()
        {
        }

        public VideoInfo(VideoInfo info)
        {
            this.Clone(info);
        }

        public void Clone(VideoInfo info)
        {
            foreach (PropertyInfo info2 in base.GetType().GetProperties())
            {
                info2.SetValue(this, info2.GetValue(info, null), null);
            }
        }

        // Properties
        public DateTime DateTaken
        {
            get
            {
                return this._dateTaken;
            }
            set
            {
                this._dateTaken = value;
            }
        }

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

        public string Location
        {
            get
            {
                return this._location;
            }
            set
            {
                this._location = value;
            }
        }

        public int MaxPageIndex
        {
            get
            {
                return this._maxPageIndex;
            }
            set
            {
                this._maxPageIndex = value;
            }
        }

        public int PageIndex
        {
            get
            {
                return this._pageIndex;
            }
            set
            {
                this._pageIndex = value;
            }
        }

        public int PageSize
        {
            get
            {
                return this._pageSize;
            }
            set
            {
                this._pageSize = value;
            }
        }

        public byte[] Thumbnail
        {
            get
            {
                return this._thumbnail;
            }
            set
            {
                this._thumbnail = value;
            }
        }

        public int VideoID
        {
            get
            {
                return this._videoID;
            }
            set
            {
                this._videoID = value;
            }
        }

        public string YouTubeCode
        {
            get
            {
                return this._youTubeCode;
            }
            set
            {
                this._youTubeCode = value;
            }
        }
    }


}
