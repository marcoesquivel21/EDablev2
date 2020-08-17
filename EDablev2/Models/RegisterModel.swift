//
//  RegisterModel.swift
//  EDablev2
//
//  Created by Marco Esquivel on 3/11/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import Foundation

class Register{
    var registerDic:[String:String] = [String:String]()
    
    init(){
        registerDic["AL"] = "https://www.sos.alabama.gov/alabama-votes/voter/register-to-vote"
        registerDic["CA"] = "https://registertovote.ca.gov/"
        registerDic["AZ"] = "https://servicearizona.com/voterRegistration"
        registerDic["AK"] = "https://voterregistration.alaska.gov/"
        registerDic["AR"] = "https://www.sos.arkansas.gov/elections/voter-information/voter-registration-information/request-for-a-voter-registration-application"
        registerDic["CO"] = "https://www.sos.state.co.us/pubs/elections/vote/VoterHome.html?menuheaders=5"
        registerDic["CT"] = "https://voterregistration.ct.gov/OLVR/welcome.do"
        registerDic["DE"] = "https://ivote.de.gov/voterview"
        registerDic["FL"] = "https://registertovoteflorida.gov/home"
        registerDic["GA"] = "https://registertovote.sos.ga.gov/GAOLVR/welcome.do#no-back-button"
        registerDic["HI"] = "https://olvr.hawaii.gov/"
        registerDic["ID"] = "https://apps.idahovotes.gov/OnlineVoterRegistration/"
        registerDic["IL"] = "https://ova.elections.il.gov/"
        registerDic["IN"] = "https://indianavoters.in.gov/"
        registerDic["IA"] = "https://mymvd.iowadot.gov/Account/Login?ReturnUrl=%2fVoterRegistration"
        registerDic["KS"] = "https://www.sos.ks.gov/forms/elections/voterregistration.pdf"
        registerDic["KY"] = "https://vrsws.sos.ky.gov/ovrweb/"
        registerDic["LA"] = "https://voterportal.sos.la.gov/VoterRegistration"
        registerDic["ME"] = "https://www.maine.gov/sos/cec/elec/voter-info/votreg.html"
        registerDic["MD"] = "https://voterservices.elections.maryland.gov/OnlineVoterRegistration/InstructionsStep1"
        registerDic["MA"] = "https://www.sec.state.ma.us/OVR/Pages/CheckEligibility.aspx?&Action=Register"
        registerDic["MI"] = "https://mvic.sos.state.mi.us/RegisterVoter"
        registerDic["MN"] = "https://mnvotes.sos.state.mn.us/VoterRegistration/VoterRegistrationMain.aspx"
        registerDic["MS"] = "https://www.ms.gov/sos/voter_registration/documents/voter_registration_application.pdf"
        registerDic["MO"] = "https://s1.sos.mo.gov/elections/voterregistration/"
        registerDic["MT"] = "https://sosmt.gov/elections/vote/"
        registerDic["NE"] = "https://www.nebraska.gov/apps-sos-voter-registration/"
        registerDic["NV"] = "https://www.nvsos.gov/SOSVoterServices/Registration/Step0.aspx"
        registerDic["NH"] = "https://sos.nh.gov/HowRegVote.aspx"
        registerDic["NJ"] = "https://www.state.nj.us/state/elections/voter-registration.shtml"
        registerDic["NM"] = "https://portal.sos.state.nm.us/OVR/WebPages/InstructionsStep1.aspx"
        registerDic["NY"] = "https://voterreg.dmv.ny.gov/MotorVoter/?_ga=2.223394395.151172167.1583457126-491893272.1583457126"
        registerDic["NC"] = "https://www.ncsbe.gov/Portals/0/FilesP/NCVRRegFormv102013eng.pdf"
        registerDic["ND"] = "https://vip.sos.nd.gov/PortalList.aspx"
        registerDic["OH"] = "https://olvr.ohiosos.gov/"
        registerDic["OK"] = "https://www.ok.gov/elections/documents/Voter_Registration_Application.pdf"
        registerDic["OR"] = "https://secure.sos.state.or.us/orestar/vr/register.do?lang=eng&source=SOS"
        registerDic["PA"] = "https://www.pavoterservices.pa.gov/Pages/VoterRegistrationApplication.aspx"
        registerDic["RI"] = "https://vote.sos.ri.gov/Home/RegistertoVote"
        registerDic["SC"] = "https://info.scvotes.sc.gov/eng/ovr/start.aspx"
        registerDic["SD"] = "https://sdsos.gov/elections-voting/voting/register-to-vote/default.aspx"
        registerDic["TN"] = "https://ovr.govote.tn.gov/"
        registerDic["TX"] = "https://webservices.sos.state.tx.us/vrapp/index.asp"
        registerDic["UT"] = "https://vote.utah.gov/additionalInfo.html"
        registerDic["VT"] = "https://sos.vermont.gov/elections/voters/registration/"
        registerDic["VA"] = "https://vote.elections.virginia.gov/Registration/Eligibility"
        registerDic["WA"] = "https://voter.votewa.gov/WhereToVote.aspx"
        registerDic["DC"] = "https://www.vote4dc.com/ApplyInstructions/Register"
        registerDic["WV"] = "https://ovr.sos.wv.gov/Register/Landing#Qualifications"
        registerDic["WI"] = "https://myvote.wi.gov/en-US/RegisterToVote"
        registerDic["WY"] = "https://soswy.state.wy.us/Forms/Elections/General/VoterRegistrationForm.pdf"
        
    }
}
