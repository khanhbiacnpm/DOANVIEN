/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.Employees
{
   public class EmployeesInfo
	{
        private int _id;
        private string _fullname;
        private string _othername;
        private string _specialname;
        private string _empcode;
        private decimal _unitid;
        private DateTime _birthday;
        private bool _sex;
        private string _image;
        private string _placeofbirth;
        private int _place_provinceid;
        private string _nativeplace;
        private int _nativeplace_provinceid;
        private int _provinceid;
        private int _nationalityid;
        private int _religionid;
        private string _identitynum;
        private DateTime _dateofissue;
        private string _placeofissue;
        private string _cellphone;
        private string _officephone;
        private string _email;
        private string _taxcode;
        private string _forte;
        private string _hobby;
        private string _placeofresidence;
        private string _placeofcurrent;
        private string _height;
        private string _weigh;
        private int _bloodgroupid;
        private int _culturalid;
        private int _qualificationid;
        private int _politicalconsciousnessid;
        private int _statemanagementid;
        private int _positionid;
        private string _socialinsurancenum;
        private string _healthinsurancenum;
        private string _placetomedicalexam;
        private int _soldiertypeid;
        private int _socialwelfaretypeid;
        private DateTime _retiredate;
        private DateTime _startdate;
        private string _prevunit;
        private string _prevwork;
        private string _note;
        private string _mainjob;
        private string _honourable;
        private string _workabroad;
        private string _goabroad;
        private string _economy;
        private string _family;
        private DateTime _daterecruit;
        private int _asalaryid;
        private int _bsalaryid;
        private int _professionid;
        private bool _isactive;
        private int _familytypeid;
        private int _familytype_currentid;
        private int _employeetypeid;
        private bool _workeviroment;
        private DateTime _datesocialinsurance;
        private int _languageid;
        private int _itid;
        private int _healthid;
        private string _partyplace;
        private DateTime _partydate;
        private string _youthplace;
        private DateTime _youthdate;
        private string _allowance;
        private int _countryid;
        private string _occupation;
        private int _officeid;
        private string _unitrecruit;
        private int _partyposition;
        private int _comunityposition;
        private int _DVYeuCau;
        private int _idHinhThucDaoTao;
        private int _idLoaiHopDong;
        private DateTime _NgayKetNapDang;
        private DateTime _NgayChinhThuc;
        private string _NoiKetNapDang;
        private string _DangBoKetNap;
        private string  _ChiBoKetNap;
        private string _SoThe;
        private DateTime _NgayCap;
        private string _nguoiGioiThieuVaoDang;
        private string _DBDangSinhHoat;
        private string _CBDangSinhHoat;
        public int isoms { get; set; }
        public EmployeesInfo()
        {
            this._id = 0;
            this._fullname = "";
            this._othername = "";
            this._specialname = "";
            this._empcode = "";
            this._unitid = 0;
            this._birthday = Convert.ToDateTime("01/01/1900");
            this._sex = true;
            this._image = "";
            this._placeofbirth = "";
            this._place_provinceid = 0;
            this._nativeplace = "";
            this._nativeplace_provinceid = 0;
            this._provinceid = 0;
            this._nationalityid = 0;
            this._religionid = 0;
            this._identitynum = "";
            this._dateofissue = Convert.ToDateTime("01/01/1999");
            this._placeofissue = "";
            this._cellphone = "";
            this._officephone = "";
            this._email = "";
            this._taxcode = "";
            this._forte = "";
            this._hobby = "";
            this._placeofresidence = "";
            this._placeofcurrent = "";
            this._height = "";
            this._weigh = "";
            this._bloodgroupid = 0;
            this._culturalid = 0;
            this._qualificationid = 0;
            this._politicalconsciousnessid = 0;
            this._statemanagementid = 0;
            this._positionid = 0;
            this._socialinsurancenum = "";
            this._healthinsurancenum = "";
            this._placetomedicalexam = "";
            this._soldiertypeid = 0;
            this._socialwelfaretypeid = 0;
            this._retiredate = Convert.ToDateTime("01/01/1900");
            this._startdate = Convert.ToDateTime("01/01/1900");
            this._prevunit = "";
            this._prevwork = "";
            this._note = "";
            this._mainjob = "";
            this._honourable = "";
            this._workabroad = "";
            this._goabroad = "";
            this._economy = "";
            this._family = "";
            this._daterecruit = Convert.ToDateTime("01/01/1900");
            this._asalaryid = 0;
            this._bsalaryid = 0;
            this._professionid = 0;
            this._isactive = true;
            this._familytypeid = 0;
            this._familytype_currentid = 0;
            this._employeetypeid = 0;
            this._workeviroment = true;
            this._datesocialinsurance = Convert.ToDateTime("01/01/1900");
            this._languageid = 0;
            this._itid = 0;
            this._healthid = 0;
            this._partyplace = "";
            this._partydate = Convert.ToDateTime("01/01/1900");
            this._youthplace = "";
            this._youthdate = Convert.ToDateTime("01/01/1900");
            this._allowance = "";
            this._countryid = 0;
            this._occupation = "";
            this._officeid = 0;
            this._unitrecruit = "";
            this._partyposition = 0;
            this._comunityposition = 0;
            this._DVYeuCau = 0;
            this._idHinhThucDaoTao = 0;
            this._idLoaiHopDong = 0;
            this._NgayKetNapDang = Convert.ToDateTime("01/01/1900");
            this._NgayChinhThuc = Convert.ToDateTime("01/01/1900");
            this._NoiKetNapDang = "";
            this._DangBoKetNap = "";
            this._ChiBoKetNap = "";
            this._NgayCap = Convert.ToDateTime("01/01/1900");
            this._DBDangSinhHoat = "";
            this._CBDangSinhHoat = "";
            this._nguoiGioiThieuVaoDang = "";
        }
        private string _Passport;
        private DateTime _PassportDate;
        private int _PassPortIssue;
        private DateTime _NgayNhapNgu;
        private DateTime _NgayXuatNgu;
        private string _QuanHamCaoNhat;
       //
           //
        public int idLoaiHopDong
        {
            get { return this._idLoaiHopDong; }
            set { this._idLoaiHopDong = value; }
        }
        public int id
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string unitrecruit
        {
            get { return this._unitrecruit; }
            set { this._unitrecruit = value; }
        }

        public string Passport
        {
            get { return this._Passport; }
            set { this._Passport = value; }
        }
        public DateTime PassportDate
        {
            get { return this._PassportDate; }
            set { this._PassportDate = value; }

        }
        public DateTime NgayNhapNgu
        {
            get { return this._NgayNhapNgu; }
            set { this._NgayNhapNgu = value; }

        }
        public DateTime NgayXuatNgu
        {
            get { return this._NgayXuatNgu; }
            set { this._NgayXuatNgu = value; }

        }
        public string QuanHamCaoNhat
        {
            get { return this._QuanHamCaoNhat; }
            set { this._QuanHamCaoNhat = value; }
        }

        public int PassPortIssue
        {
            get { return this._PassPortIssue; }
            set { this._PassPortIssue = value; }
        }
        public int partyposition
        {
            get { return this._partyposition; }
            set { this._partyposition = value; }
        }
        public int comunityposition
        {
            get { return this._comunityposition; }
            set { this._comunityposition = value; }
        }
        public int officeid
        {
            get { return this._officeid; }
            set { this._officeid = value; }
        }
        public string fullname
        {
            get { return this._fullname; }
            set { this._fullname = value; }
        }
        public string othername
        {
            get { return this._othername; }
            set { this._othername = value; }
        }
        public string specialname
        {
            get { return this._specialname; }
            set { this._specialname = value; }
        }
        public string empcode
        {
            get { return this._empcode; }
            set { this._empcode = value; }
        }
        public decimal unitid
        {
            get { return this._unitid; }
            set { this._unitid = value; }
        }
        public DateTime birthday
        {
            get { return this._birthday; }
            set { this._birthday = value; }
        }
        public bool sex
        {
            get { return this._sex; }
            set { this._sex = value; }
        }
        public string image
        {
            get { return this._image; }
            set { this._image = value; }
        }
        public string placeofbirth
        {
            get { return this._placeofbirth; }
            set { this._placeofbirth = value; }
        }
        public int place_provinceid
        {
            get { return this._place_provinceid; }
            set { this._place_provinceid = value; }
        }
        public string nativeplace
        {
            get { return this._nativeplace; }
            set { this._nativeplace = value; }
        }
        public int nativeplace_provinceid
        {
            get { return this._nativeplace_provinceid; }
            set { this._nativeplace_provinceid = value; }
        }
        public int provinceid
        {
            get { return this._provinceid; }
            set { this._provinceid = value; }
        }
        public int nationalityid
        {
            get { return this._nationalityid; }
            set { this._nationalityid = value; }
        }
        public int religionid
        {
            get { return this._religionid; }
            set { this._religionid = value; }
        }
        public string identitynum
        {
            get { return this._identitynum; }
            set { this._identitynum = value; }
        }
        public DateTime dateofissue
        {
            get { return this._dateofissue; }
            set { this._dateofissue = value; }
        }
        public string placeofissue
        {
            get { return this._placeofissue; }
            set { this._placeofissue = value; }
        }
        public string cellphone
        {
            get { return this._cellphone; }
            set { this._cellphone = value; }
        }
        public string officephone
        {
            get { return this._officephone; }
            set { this._officephone = value; }
        }
        public string email
        {
            get { return this._email; }
            set { this._email = value; }
        }
        public string taxcode
        {
            get { return this._taxcode; }
            set { this._taxcode = value; }
        }
        public string forte
        {
            get { return this._forte; }
            set { this._forte = value; }
        }
        public string hobby
        {
            get { return this._hobby; }
            set { this._hobby = value; }
        }
        public string placeofresidence
        {
            get { return this._placeofresidence; }
            set { this._placeofresidence = value; }
        }
        public string placeofcurrent
        {
            get { return this._placeofcurrent; }
            set { this._placeofcurrent = value; }
        }
        public string height
        {
            get { return this._height; }
            set { this._height = value; }
        }
        public string weigh
        {
            get { return this._weigh; }
            set { this._weigh = value; }
        }
        public int bloodgroupid
        {
            get { return this._bloodgroupid; }
            set { this._bloodgroupid = value; }
        }
        public int culturalid
        {
            get { return this._culturalid; }
            set { this._culturalid = value; }
        }
        public int qualificationid
        {
            get { return this._qualificationid; }
            set { this._qualificationid = value; }
        }
        public int politicalconsciousnessid
        {
            get { return this._politicalconsciousnessid; }
            set { this._politicalconsciousnessid = value; }
        }
        public int statemanagementid
        {
            get { return this._statemanagementid; }
            set { this._statemanagementid = value; }
        }
        public int positionid
        {
            get { return this._positionid; }
            set { this._positionid = value; }
        }
        public string socialinsurancenum
        {
            get { return this._socialinsurancenum; }
            set { this._socialinsurancenum = value; }
        }
        public string healthinsurancenum
        {
            get { return this._healthinsurancenum; }
            set { this._healthinsurancenum = value; }
        }
        public string placetomedicalexam
        {
            get { return this._placetomedicalexam; }
            set { this._placetomedicalexam = value; }
        }
        public int soldiertypeid
        {
            get { return this._soldiertypeid; }
            set { this._soldiertypeid = value; }
        }
        public int socialwelfaretypeid
        {
            get { return this._socialwelfaretypeid; }
            set { this._socialwelfaretypeid = value; }
        }
        public DateTime retiredate
        {
            get { return this._retiredate; }
            set { this._retiredate = value; }
        }
        public DateTime startdate
        {
            get { return this._startdate; }
            set { this._startdate = value; }
        }
        public string prevunit
        {
            get { return this._prevunit; }
            set { this._prevunit = value; }
        }
        public string prevwork
        {
            get { return this._prevwork; }
            set { this._prevwork = value; }
        }
        public string note
        {
            get { return this._note; }
            set { this._note = value; }
        }
        public string mainjob
        {
            get { return this._mainjob; }
            set { this._mainjob = value; }
        }
        public string honourable
        {
            get { return this._honourable; }
            set { this._honourable = value; }
        }
        public string workabroad
        {
            get { return this._workabroad; }
            set { this._workabroad = value; }
        }
        public string goabroad
        {
            get { return this._goabroad; }
            set { this._goabroad = value; }
        }
        public string economy
        {
            get { return this._economy; }
            set { this._economy = value; }
        }
        public string family
        {
            get { return this._family; }
            set { this._family = value; }
        }
        public DateTime daterecruit
        {
            get { return this._daterecruit; }
            set { this._daterecruit = value; }
        }
        public int asalaryid
        {
            get { return this._asalaryid; }
            set { this._asalaryid = value; }
        }
        public int bsalaryid
        {
            get { return this._bsalaryid; }
            set { this._bsalaryid = value; }
        }
        public int professionid
        {
            get { return this._professionid; }
            set { this._professionid = value; }
        }
        public bool isactive
        {
            get { return this._isactive; }
            set { this._isactive = value; }
        }
        public int familytypeid
        {
            get { return this._familytypeid; }
            set { this._familytypeid = value; }
        }
        public int familytype_currentid
        {
            get { return this._familytype_currentid; }
            set { this._familytype_currentid = value; }
        }
        public int employeetypeid
        {
            get { return this._employeetypeid; }
            set { this._employeetypeid = value; }
        }
        public bool workeviroment
        {
            get { return this._workeviroment; }
            set { this._workeviroment = value; }
        }
        public DateTime datesocialinsurance
        {
            get { return this._datesocialinsurance; }
            set { this._datesocialinsurance = value; }
        }
        public int languageid
        {
            get { return this._languageid; }
            set { this._languageid = value; }
        }
        public int itid
        {
            get { return this._itid; }
            set { this._itid = value; }
        }
        public int healthid
        {
            get { return this._healthid; }
            set { this._healthid = value; }
        }
        public string partyplace
        {
            get { return this._partyplace; }
            set { this._partyplace = value; }
        }
        public DateTime partydate
        {
            get { return this._partydate; }
            set { this._partydate = value; }
        }
        public string youthplace
        {
            get { return this._youthplace; }
            set { this._youthplace = value; }
        }
        public DateTime youthdate
        {
            get { return this._youthdate; }
            set { this._youthdate = value; }
        }
        public string allowance
        {
            get { return this._allowance; }
            set { this._allowance = value; }
        }
        public int countryid
        {
            get { return this._countryid; }
            set { this._countryid = value; }
        }
        public string occupation
        {
            get { return this._occupation; }
            set { this._occupation = value; }
        }
        public int DVYeuCau
        {
            get { return this._DVYeuCau; }
            set { this._DVYeuCau = value; }
        }
        public int idHinhThucDaoTao
        {
            get { return this._idHinhThucDaoTao; }
            set { this._idHinhThucDaoTao = value; }
        }
        public DateTime NgayKetNapDang
        {
            get { return this._NgayKetNapDang; }
            set { this._NgayKetNapDang = value; }
        }
        public DateTime NgayChinhThuc
        {
            get { return this._NgayChinhThuc; }
            set { this._NgayChinhThuc = value; }
        }
        public DateTime NgayCap
        {
            get { return this._NgayCap; }
            set { this._NgayCap = value; }
        }
        public string NoiKetNapDang
        {
            get { return this._NoiKetNapDang; }
            set { this._NoiKetNapDang = value; }
        }
        public string DangBoKetNap
        {
            get { return this._DangBoKetNap; }
            set { this._DangBoKetNap = value; }
        }
        public string ChiBoKetNap
        {
            get { return this._ChiBoKetNap; }
            set { this._ChiBoKetNap = value; }
        }
        public string SoThe
        {
            get { return this._SoThe; }
            set { this._SoThe = value; }
        }
        public string nguoiGioiThieuVaoDang {
            get { return this._nguoiGioiThieuVaoDang; }
            set { this._nguoiGioiThieuVaoDang = value; }
        }
        public string DBDangSinhHoat
        {
            get { return this._DBDangSinhHoat; }
            set { this._DBDangSinhHoat = value; }
        }
        public string CBDangSinhHoat
        {
            get { return this._CBDangSinhHoat; }
            set { this._CBDangSinhHoat = value; }
        }
	}

}
