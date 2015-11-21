using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MicNets.Model;
using System.Data;
using System.Drawing;
using MicNets.DAL;

namespace MicNets.BizLogic
{
    public class Photo : PhotoInfo
    {
        // Methods
        public bool AddOne()
        {
            PhotoDAC odac = new PhotoDAC(this);
            if (odac.InsertOne() >= Utility.ONE_ROW_AFFECTED)
            {
                base.PhotoID = odac.PhotoID;
                return true;
            }
            return false;
        }

        public Bitmap CreateThumbnail(Bitmap source, int thumbWi, int thumbHi)
        {
            if ((source.Width < thumbWi) && (source.Height < thumbHi))
            {
                return source;
            }
            Bitmap image = null;
            try
            {
                int num;
                int num2;
                if (source.Width > source.Height)
                {
                    num = thumbWi;
                    num2 = source.Height * (thumbWi / source.Width);
                }
                else
                {
                    num2 = thumbHi;
                    num = source.Width * (thumbHi / source.Height);
                }
                image = new Bitmap(num, num2);
                using (Graphics graphics = Graphics.FromImage(image))
                {
                    graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    graphics.FillRectangle(Brushes.White, 0, 0, num, num2);
                    graphics.DrawImage(source, 0, 0, num, num2);
                    return image;
                }
            }
            catch
            {
                image = null;
            }
            return image;
        }

        public Bitmap GetThumbnailByWidth(Bitmap source, decimal thumbWidth)
        {
            int thumbHi = Convert.ToInt32((decimal)(source.Height * (thumbWidth / source.Width)));
            return this.CreateThumbnail(source, Convert.ToInt32(thumbWidth), thumbHi);
        }

        public DataTable LoadAll()
        {
            PhotoDAC odac = new PhotoDAC(this);
            DataTable table = odac.SelectAll();
            base.MaxPageIndex = odac.MaxPageIndex;
            return table;
        }
    }
}
