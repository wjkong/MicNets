using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AjaxControlToolkit;
using MicNets.BizLogic;
using MicNets.Model;
using System.IO;

namespace MicNets.Web.Controls
{
    public partial class ctlMediaUpload : BaseControl
    {
        // Fields
        protected Button btnUploadPhoto;
        protected Button btnUploadVideo;
        protected CalendarExtender CalendarExtender1;
        protected CalendarExtender CalendarExtender2;
        protected FileUpload filThumbnail;
        protected FileUpload filVideo;
        protected HyperLink HyperLink1;
        protected Image Image10;
        protected Image Image2;
        protected Image Image4;
        protected Image Image5;
        protected Image Image6;
        protected Image Image7;
        protected Image Image8;
        protected Image Image9;
        protected Image imgCalendarPhoto;
        protected Image imgCalendarVideo;
        protected MultiView mvwMedia;
        protected RadioButtonList radlMedia;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected RequiredFieldValidator RequiredFieldValidator4;
        protected RequiredFieldValidator RequiredFieldValidator5;
        protected RequiredFieldValidator RequiredFieldValidator6;
        protected RequiredFieldValidator RequiredFieldValidator7;
        protected RequiredFieldValidator RequiredFieldValidator8;
        protected ScriptManager scriptMan;
        protected TextBox txtDatePhotoTaken;
        protected TextBox txtDateTaken;
        protected TextBox txtVideoDescription;
        protected TextBox txtVideoLocation;
        protected TextBox txtVideoYouTubeCode;
        protected View vwMusic;
        protected View vwPhoto;
        protected View vwVideo;

        // Methods
        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                Photo photo = new Photo();
                photo.DateTaken = Convert.ToDateTime(this.txtDatePhotoTaken.Text.Trim());
                if (photo.AddOne())
                {
                    this.filThumbnail.PostedFile.SaveAs(string.Concat(new object[] { base.Request.PhysicalApplicationPath, @"\Image\PremiumMemberZone\Thumbnail\", photo.PhotoID, ".jpg" }));
                    base.BuildPopup("Successfully, uploaded a photo to server.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
        }

        protected void btnUploadVideo_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                Video video = new Video();
                video.DateTaken = Convert.ToDateTime(this.txtDateTaken.Text.Trim());
                video.Description = this.txtVideoDescription.Text.Trim();
                video.Location = this.txtVideoLocation.Text.Trim();
                video.YouTubeCode = this.txtVideoYouTubeCode.Text.Trim();
                video.Thumbnail = this.GetUploadedImage(this.filVideo);
                if (video.AddOne())
                {
                    base.BuildPopup("Successfully, uploaded a new video to server.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
        }

        private byte[] GetUploadedImage(FileUpload uploadFile)
        {
            Stream inputStream = uploadFile.PostedFile.InputStream;
            int contentLength = uploadFile.PostedFile.ContentLength;
            string contentType = uploadFile.PostedFile.ContentType;
            byte[] buffer = new byte[contentLength];
            inputStream.Read(buffer, 0, contentLength);
            return buffer;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void radlMedia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.radlMedia.SelectedValue.Equals("Photo"))
            {
                this.mvwMedia.SetActiveView(this.vwPhoto);
            }
            else if (this.radlMedia.SelectedValue.Equals("Video"))
            {
                this.mvwMedia.SetActiveView(this.vwVideo);
            }
            else
            {
                this.mvwMedia.SetActiveView(this.vwMusic);
            }
        }


    }
}