--001230

-- �������뻪ɽ�۽��ĳ���

--************************************************************************
--MisDescBegin
--�ű���
x001230_g_ScriptId = 1230

--�¼�
x001230_g_Update = {

    ["id01"] = 0,
    ["id02"] = 20,
    ["id03"] = 30,

}

--��ʾ��Ϣ
x001230_g_msg = {

    ["cj"]	= "�μӻ�ɽ�۽�",
    ["jl"]	= "��ȡ��ɽ�۽�����",
    ["Mail"]	= "ȷ�Ͻ���",

}

--����,���������Ҫ�ͻ���еĶ�Ӧ
--���е����ݵĵ�0λλ��������ʾ��Ƿ���
x001230_g_nActivityId = 9

-- ������ʵ����Ҫ����������ֱ�Ӱ����е��ˣ�����һ�������Ϳ����� 
x001230_g_nScnenId = 125

-- �����ǲ��ǻ����ʱ��ı�־
x001230_g_bHuashaning = 0

-- 9�����ɵ�ɱ����
x001230_g_nMenpaikills = {{id=0,kill=0},
													{id=1,kill=0},
													{id=2,kill=0},
													{id=3,kill=0},
													{id=4,kill=0},
													{id=5,kill=0},
													{id=6,kill=0},
													{id=7,kill=0},
													{id=8,kill=0},}

-- [ QUFEI 2007-07-27 17:27 UPDATE ]
-- 9������ǰ���������ID		
-- ���� take ��ʾ������Ƿ��������
x001230_g_nMenpaiQiansan = {{id=0,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=1,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=2,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=3,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
												    {id=4,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=5,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=6,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=7,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},
													  {id=8,player01="",player02="",player03="",playerid01=0,playerid02=0,playerid03=0},}

-- [ QUFEI 2007-07-27 17:27 UPDATE ]
-- ���ɸ߼�ʱװ����
x001230_g_nMenpaiShiZhuang = {{id=10124009,name="��ɫ"},
															{id=10124010,name="ʥ��"},
															{id=10124011,name="��İ"},
															{id=10124013,name="��ѩ"},
															{id=10124012,name="��Ӱ"},
															{id=10124014,name="����"},
															{id=10124017,name="����"},
															{id=10124015,name="����"},
															{id=10124016,name="����"},}
															
-- ���Ͻ���
x001230_g_nCailiaoJiangli	 = {{id=20500000,name="������Ƭ"},
															{id=20501000,name="�޲���Ƭ"},
															{id=20502000,name="������Ƭ"},}

x001230_g_bEndTime = 0
x001230_g_bMenpai = ""

x001230_g_WorldGlobal = 21

x001230_g_PlayerKc = {}				-- ÿ�����ɱ�˵���Ŀ
x001230_g_PlayerName = {}			-- ÿ����ҵ�����
x001230_g_PlayerNum = 0				-- �����Ŀ

--[ QUFEI 2007-07-27 15:04 UPDATE ]
x001230_g_PlayerMenpai = {}		-- ÿ����ҵ�����
x001230_g_PlayerId = {}

x001230_g_PreTime = 0


--���������2���ؼ�ˢ�µ�....
x001230_g_MJPosA = {
	{x=135, y=125},{x=141, y=123}
}

--�������ܵ�6���ؼ�ˢ�µ�....
x001230_g_MJPosB = {
	{x=143, y=140, rand=-1},
	{x=153, y=121, rand=-1},
	{x=150, y=110, rand=-1},
	{x=138, y=104, rand=-1},
	{x=125, y=107, rand=-1},
	{x=120, y=111, rand=-1},
	{x=122, y=132, rand=-1},
	{x=131, y=138, rand=-1}
}

--�ؼ���....
x001230_g_MJTblA = {
	5009,5010
}

--�ؼ���....
x001230_g_MJTblB = {
	5004,5005,5006,5007,5008
}

x001230_g_MJNameTbl = {
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����"
}

--�ؼ��ű�....
x001230_g_MJScript = 001235


--**********************************
--������ں���
--**********************************
function x001230_OnDefaultEvent( sceneId, selfId, targetId )
	
    local	key	= GetNumText()

	if key == x001230_g_Update["id01"] then
		if LuaFnHasTeam( sceneId, selfId ) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B��ɽ�۽�");
				AddText(sceneId,"  ���뿪����֮���ٱ����μӡ�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return 0
		end
    
        -- 0������˫�����״̬���ˣ����ܱ���
        if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  ˫�����״̬�£����ܱ����μӻ�ɽ�۽���");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 1,����ȼ�����30
        if GetLevel(sceneId, selfId) < 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  �μӻ�ɽ�۽�����Ҫ30�����ϲ��ܲμӣ�������Ϊ���������ȵ�30��֮���������Ұɡ�");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 2,����ǲ����Ѿ���ʼ�ˣ�����Ѿ���ʼ���Ͳ����ٽ�ȥ��
        local nWeek = GetTodayWeek()
        if (nWeek==0 or nWeek==4 or nWeek==2) ~= 1  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  ���ڲ��ǲμӻ�ɽ�۽��ı���ʱ�䣬�����ܶ������ĺ�����������");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end
        
        -- 3,ʱ���⣬���ܱ�����ʱ�䣬8�㵽8��30��
        --begin modified by zhangguoxin 090207
        --local nHour = GetHourTime()
        --local temp = floor(nHour/100)*100
        --PrintNum(nHour-temp)
        --if ((nWeek==0) and (nHour-temp<60 or nHour-temp>=62)) or 
        --     ( (nWeek==2 or nWeek==4) and (nHour-temp<76 or nHour-temp>=78))  then		--����ʱ��2 4��19:00-19:30���յ�15:00-15:30
        local nQuarter = mod(GetQuarterTime(),100);
        if ((nWeek==0) and (nQuarter < 60 or nQuarter >= 62 )) or 
             ( (nWeek==2 or nWeek==4) and (nQuarter < 76 or nQuarter >= 78))  then		--����ʱ��2 4��19:00-19:30���յ�15:00-15:30
        --end modified by zhangguoxin 090207
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  ���ڲ��ǲμӻ�ɽ�۽��ı���ʱ�䣬�ȵ����ʼ��ʱ���������Ұɡ�");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end

        -- 4,�������,ʹ�û��������������������Щ����
        local nMenpai = LuaFnGetMenPai(sceneId, selfId)
        
        if nMenpai == 9   then
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  �Բ�����û�����ɣ�������ô�쵽30���İ�������");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
        
        local nPeopleNum = GetActivityParam(sceneId, x001230_g_nActivityId, nMenpai)
        -- a,���������������ǲ����Ѿ���10���ˣ�
        if nPeopleNum < 10 then
            -- �����Խ���
        elseif nPeopleNum >=10 and nPeopleNum < 30  then
            -- �ж��ǲ��������������ɣ�
            for i=0, 8   do
                if nMenpai ~= i   then
                    if GetActivityParam(sceneId, x001230_g_nActivityId, nMenpai) >= nPeopleNum  then
                        --���Խ���
                    end
                end
            end
            -- ��Ҫ�ȴ�������ɣ��˺����
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  �Բ��𣬱��λ�ɽ�۽������ɲμӵ��������࣬��ȴ����������˽���֮���ٽ��롣");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
            
        elseif nPeopleNum >= 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B��ɽ�۽�");
                AddText(sceneId,"  �Բ��𣬹����ɲμӵ���������30�ˡ�");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
        -- ������һЩ���Խ��뻪ɽ�۽����ж�
        -- PrintNum(selfId)
        -- local Name = GetName(sceneId, selfId)
        -- LuaFnSendSystemMail( sceneId, Name, "mail test" )
        -- ע�⣬���ϵͳ�ǲ����������ģ�ֱ�ӽ��볡���Ϳ�����
        local nPos_X;
        local nPos_Z;
        
        if nMenpai == 0  then
            nPos_X = 134
            nPos_Z = 18
        elseif nMenpai == 1   then
            nPos_X = 22
            nPos_Z = 123
        elseif nMenpai == 2   then
            nPos_X = 236
            nPos_Z = 108
        elseif nMenpai == 3   then
            nPos_X = 193
            nPos_Z = 233
        elseif nMenpai == 4   then
            nPos_X = 93
            nPos_Z = 236
        elseif nMenpai == 5   then
            nPos_X = 236
            nPos_Z = 174
        elseif nMenpai == 6   then
            nPos_X = 23
            nPos_Z = 182
        elseif nMenpai == 7   then
            nPos_X = 48
            nPos_Z = 34
        elseif nMenpai == 8   then
            nPos_X = 228
            nPos_Z = 38
        elseif nMenpai == 9   then
            nPos_X = 100
            nPos_Z = 100
        end
        
        -- [ QUFEI 2007-07-30 18:31 UPDATE ]
        -- ��ս������
        -- PrintNum(selfId)
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
        SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
        
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x001230_g_nScnenId, nPos_X, nPos_Z)
        --�ͳ��
        LuaFnAuditQuest(sceneId, selfId, "��ɽ�۽�")
   
   elseif key == x001230_g_Update["id02"] then
        -- ��ɽ�۽����� ���գ�16:00-17:00 ��2����4��20:00-21:00
        local nWeek = GetTodayWeek()
        --begin modified by zhangguoxin 090207
				--local nHour = GetHourTime()
				--local temp = floor(nHour/100)*100
				--if ((nWeek==0) and (nHour-temp<68 and nHour-temp>=64)) or 
        --    ( (nWeek==2 or nWeek==4) and (nHour-temp<84 and nHour-temp>=80))  then
        local nQuarter = mod(GetQuarterTime(),100);
        if ( (nWeek==0) and (nQuarter < 68 and nQuarter >= 64) ) 
        	or( (nWeek==2 or nWeek==4) and (nQuarter < 84 and nQuarter >= 80) )  then
        --end modified by zhangguoxin 090207
            x001230_OnHuashanJiangli( sceneId, selfId, targetId )
            return 0
        else            
            x001230_MyMsgBox( sceneId, selfId, "��ȡ��ɽ�۽�������ʱ���ѹ����ȵ������һ��Сʱ���������Ұɡ�" )
            return 0		
        end
   elseif key == x001230_g_Update["id03"] then
   			
   			local index01 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli01 )
				local index02 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli02 )
				local index03 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli03 )
   			   			
   			if ( index01 == 1 and index02 == 1 and index03 == 1 ) then
					BeginEvent(sceneId)
					local strText = "���Ѿ�������������ٽ��������´ζ��ʱ�������Ұɡ�"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
					
					return 0
   			end
   			
   			-- ���SelfId�Ƿ���Ч
   			if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
					return 0
				end
				if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
					return 0
				end
   			
   			LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_HUASHANJIANGLI)
   			
   			local strLogCheck = format(	"HuaShanLunJian_AskNpcScriptMail    id=%X, Param01=%d, Param02=%d, Param03=%d", LuaFnGetGUID(sceneId, selfId), index01, index02, index03 )
				LuaFnLogCheck(strLogCheck)
				
				return 0
   end
end


--**********************************
--�о��¼�
--**********************************
function x001230_OnEnumerate( sceneId, selfId, targetId )	
    AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["cj"], 6, x001230_g_Update["id01"] )        
    
    --[ QUFEI 2007-07-27 11:13 UPDATE ]	
    --��ɽ�۽�������һСʱ����ȡ����	���գ�16:00-17:00 ��2����4��20:00-21:00
    local nWeek = GetTodayWeek()
    
    --begin modified by zhangguoxin 090207
    --local nHour = GetHourTime()
    --local temp = floor(nHour/100)*100
        
    --if ((nWeek==0) and (nHour-temp<68 and nHour-temp>=64)) or 
    --    ( (nWeek==2 or nWeek==4) and (nHour-temp<84 and nHour-temp>=80))  then
    local nQuarter = mod(GetQuarterTime(),100);    
    if ((nWeek==0) and (nQuarter < 68 and nQuarter >= 64)) or 
        ( (nWeek==2 or nWeek==4) and (nQuarter < 84 and nQuarter >= 80))  then
    --begin modified by zhangguoxin 090207
        AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["Mail"], 6, x001230_g_Update["id03"] )
        AddNumText( sceneId, x001230_g_ScriptId, x001230_g_msg["jl"], 6, x001230_g_Update["id02"] )        
    end
    
end

--**********************************
--����������
--**********************************
function x001230_CheckAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x001230_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x001230_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x001230_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x001230_OnAbandon( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x001230_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x001230_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x001230_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x001230_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x001230_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x001230_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x001230_OnCopySceneTimer( sceneId, nowTime )
	
end

--[ QUFEI 2007-07-27 11:13 UPDATE ]
--��ɽ�۽������¼�
function x001230_OnHuashanJiangli( sceneId, selfId, targetId )
	--[ QUFEI 2007-07-27 11:18 UPDATE ]
	
	-- PrintStr(GetName(sceneId, selfId))	
	local name   	= GetName(sceneId, selfId)
	--��selfId���ڵ����ɷ��͹���
	local strText = ""
	local menpai  = GetMenPai(sceneId, selfId)	
	menpai = menpai+1
	local temp		=	-1	
	local idx			= {}
	idx[1] = 0
	idx[2] = 0
	idx[3] = 0
	
	local strLogCheck = ""
		
	local	timeidx = GetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME )
	
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay
	local	timenow = LuaFnGetCurrentTime()
		
	if nData ~= 0 and nData ~= timeidx	then
		-- ������콱Ʒ��ʱ
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
		SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
	end
	
	local index01 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli01 )
	local index02 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli02 )
	local index03 =	GetMissionFlag( sceneId, selfId, MF_LunjianJiangli03 )
	
	-- PrintNum(menpai)
	-- PrintNum(index01)
	-- PrintNum(index02)
	-- PrintNum(index03)
	
	-- �������	index01	index02	index03
	-- ����δȡ		0				0				0				(Ĭ��)
	-- ���ֵ�һ		0				0				1	
	-- ���ֵڶ�		0				1				0
	-- ���ֵ���		0				1				1
	-- ���ɵ�һ		1				0				0
	-- ���ɵڶ�		1				0				1
	-- ���ɵ���		1				1				0
	-- ������ȡ		1				1				1
	
	if ( index01 == 0 and index02 == 0 and index03 == 1 )
		 or ( index01 == 0 and index02 == 1 and index03 == 0 )
		 or ( index01 == 0 and index02 == 1 and index03 == 1 )
		 or ( index01 == 1 and index02 == 0 and index03 == 0 )
		 or ( index01 == 1 and index02 == 0 and index03 == 1 )
		 or ( index01 == 1 and index02 == 1 and index03 == 0 )
		 or ( index01 == 1 and index02 == 1 and index03 == 1 ) then
		 		if index01 == 1 and index02 == 1 and index03 == 1 then		 			
			 		BeginEvent(sceneId)
					strText = "���Ѿ�������������ٽ��������´ζ��ʱ�������Ұɡ�"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
				else			 		
		 				if index01 == 0 and index02 == 0 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 3 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
								
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ����ʱװ
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
																				
										-- ǿ�ư�																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- ��������
										temp = random(3)																								
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										temp = random(3)																				
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )								
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										temp = random(3)																											
										-- PrintNum(temp)
										-- PrintStr(x001230_g_nCailiaoJiangli[temp].name)
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )	
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)							
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										-- PrintNum(idx[temp])
										
										-- ����������Ʒ
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
										
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2], idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
											-- PrintStr(strText)
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
											-- PrintStr(strText)
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 																			
								
								else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end			 				
		 				elseif index01 == 0 and index02 == 1 and index03 == 0 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 2 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ����ʱװ
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- ��������
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
																				
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
																		
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 						 						 				 				
		 				elseif index01 == 0 and index02 == 1 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nMenpaiShiZhuang[menpai].id, 1 )
								ret1 = EndAddItem( sceneId, selfId )
								
								BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 1 )
								ret2 = EndAddItem( sceneId, selfId )
								
								if ret1 > 0 and ret2 > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ����ʱװ
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nMenpaiShiZhuang[menpai].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										local itemInfo01 = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nMenpaiShiZhuang[menpai].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�																													
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										-- ��������
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
					
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
																					
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL01}#{_INFOMSG%s}#{HSJL02}%d��#{_INFOMSG%s}#{HSJL03}", name, itemInfo01, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end								 								 			 				
		 				elseif index01 == 1 and index02 == 0 and index03 == 0 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 3 )
								ret = EndAddItem( sceneId, selfId )
								
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ��������
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )								
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )	
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)							
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
										
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 											 				
		 				elseif index01 == 1 and index02 == 0 and index03 == 1 then						 				
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 2 )
								ret = EndAddItem( sceneId, selfId )
								
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ��������
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										temp = random(3)												
										bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
													
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
													
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] > 0 and idx[3] == 0 then
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[2], itemInfo[2] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1], idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}��%d��#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2], idx[3], itemInfo[3] )
										elseif idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 									 				 				
		 				elseif index01 == 1 and index02 == 1 and index03 == 0 then
		 						BeginAddItem( sceneId )
								AddItem( sceneId, x001230_g_nCailiaoJiangli[1].id, 1 )
								ret = EndAddItem( sceneId, selfId )
					
								if ret > 0 then
										idx[1] = 0
										idx[2] = 0
										idx[3] = 0
										
										local	itemInfo	=	{}
										itemInfo[1]	=	""
										itemInfo[2]	=	""
										itemInfo[3]	=	""
										
										-- ��������
										temp = random(3)												
										local bagpos = TryRecieveItem( sceneId, selfId, x001230_g_nCailiaoJiangli[temp].id, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
										itemInfo[temp] = GetBagItemTransfer( sceneId, selfId, bagpos )
										
										--��ѯ����־
										strLogCheck = format("HuaShanLunJian_GetPrize	userId:%X, itemId:%d, count:%d", LuaFnGetGUID(sceneId, selfId), x001230_g_nCailiaoJiangli[temp].id, 1)
										LuaFnLogCheck(strLogCheck)
										
										-- ǿ�ư�										
										local	bindidx	=	LuaFnItemBind( sceneId, selfId, bagpos )
										
										if bindidx ~= 1 then
											local bindmsg = "��ʧ��"													
											BeginEvent( sceneId )
												AddText( sceneId, bindmsg )
											EndEvent( sceneId )
											DispatchMissionTips( sceneId, selfId )
										end
										
										idx[temp] = idx[temp]+1
										
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
										SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
													
										--��selfId���ڵ����ɷ��͹���
										if idx[1] > 0 and idx[2] == 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[1], itemInfo[1] )
										elseif idx[1] == 0 and idx[2] == 0 and idx[3] > 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[3], itemInfo[3] )
										elseif idx[1] == 0 and idx[2] > 0 and idx[3] == 0 then																
											strText = format("#{_INFOUSR%s}#P#{HSJL04}%d��#{_INFOMSG%s}#{HSJL05}", name, idx[2], itemInfo[2] )
										end
										BroadMsgByChatPipe(sceneId,selfId, strText, 7)				 											
						 		else
						 				BeginEvent(sceneId)
										strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
										AddText(sceneId,strText);
										EndEvent(sceneId)
										DispatchMissionTips(sceneId,selfId)
								end							 							 				
		 				end				 		
				end				 
	else
		BeginEvent(sceneId)
		strText = "�Բ��������û�л�ñ�����ǰ�����ĳɼ��������´ζ��Ŭ����"
		AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)						
	end		
			
end

--**********************************
--��ɽ�۽�������ʱ���¼�
--**********************************
function x001230_OnHuashanSceneTimer( sceneId, selfId )

	local nNowTimeEX = LuaFnGetCurrentTime()
	if x001230_g_bEndTime ~= 0 and nNowTimeEX > x001230_g_bEndTime+60    then
		
		BroadMsgByChatPipe(sceneId,0,"@*;SrvMsg;SCA:" .. "#P�ڱ��컪ɽ�۽����У�#Y" .. x001230_g_bMenpai .. "#P��������һ�ĵ�Ŭ�������ڻ��#Y��ɽ�۽���һ#P����������Ϊ���������������е������½컪ɽ�۽������ǰ��ÿ��ĵ�һ��ʦ�����񽫻��Ϊ#Y3�����顣",4)
		
		local mingci = 1
		local str = ""
		local MenpaiTbl = {	"����",
												"����",
												"ؤ��",
												"�䵱",
												"����",
												"����",
												"����",
												"��ɽ",
												"��ң"	}
		
		-- ������ѡ�����ҵ�ǰ5��
		for i=1, x001230_g_PlayerNum  do				
			if mingci == 1  then
					str = "��һ����" .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 2					
			elseif mingci == 2  then
					str = "�ڶ�����" .. x001230_g_PlayerName[i]	.. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"					
					mingci = 3											
			elseif mingci == 3  then
					str = "��������" .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 4
			elseif mingci == 4  then
					str = "��������" .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 5					
			elseif mingci == 5  then
					str = "��������" .. x001230_g_PlayerName[i] .. "#Y[" .. MenpaiTbl[x001230_g_PlayerMenpai[i]+1] .. "]"
					mingci = 6							
			elseif mingci == 6  then
					break
			end
			
			-- ��ȫ��������������Ź���
			AddGlobalCountNews ( sceneId, str )
		end
		
		x001230_g_PlayerNum = 0
		x001230_g_bEndTime = 0
	end
		
	-- �������������ǲ�������ң����û�У�ֱ�ӷ���
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0  then
		return
	end
	
	--��⵱ǰ�ǲ��ǻ�ɽ�۽��Ļʱ�䣬������ǣ��Ͱѳ����ڵ�������Ҷ�T��ȥ
	local bIsTime = 1
	
	local nWeek = GetTodayWeek()
	if (nWeek==0 or nWeek==4 or nWeek==2) ~= 1  then
		bIsTime = 0
	end
	
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	--local temp = floor(nHour/100)*100
	
	--	if nHour - temp < 60  or nHour - temp >= 64   then
	--  ��ʽ�ʱ�� ���գ�15:00-16:00 ��2����4��19:00-20:00
	--if ((nWeek==0) and (nHour-temp<60 or nHour-temp>=64)) or 
	--	 ( (nWeek==2 or nWeek==4) and (nHour-temp<76 or nHour-temp>=80))  then
	local nQuarter = mod(GetQuarterTime(),100);
		 
	if ((nWeek==0) and (nQuarter < 60 or nQuarter >= 64)) or 
		 ( (nWeek==2 or nWeek==4) and (nQuarter < 76 or nQuarter >= 80))  then
	--begin modified by zhangguoxin 090207
		bIsTime = 0
	end
	
	if bIsTime == 1   then
		if x001230_g_bHuashaning == 0   then
			x001230_g_bHuashaning = 1
			-- ����һ���µĻǰ����Ҫ����ɱ�˼�����
			
			for i=1 ,400  do
				x001230_g_PlayerKc[i] = 0
				x001230_g_PlayerName[i] = ""
				
				--[ QUFEI 2007-07-27 15:04 UPDATE ]
				x001230_g_PlayerMenpai[i] = -1
				x001230_g_PlayerId[i] = 0
			end
			x001230_g_PlayerNum = 0
			-- PrintNum(selfId)
			-- �����ص���ֵ
			for i=1, 9  do
				x001230_g_nMenpaiQiansan[i].id = (i-1)
				x001230_g_nMenpaiQiansan[i].player01=""
				x001230_g_nMenpaiQiansan[i].player02=""
				x001230_g_nMenpaiQiansan[i].player03=""				
				x001230_g_nMenpaiQiansan[i].playerid01=0
				x001230_g_nMenpaiQiansan[i].playerid02=0
				x001230_g_nMenpaiQiansan[i].playerid03=0				
			end			
			
			-- [ QUFEI 2007-07-30 18:31 UPDATE ]
			-- ��ս������
			if LuaFnIsObjValid(sceneId, selfId) == 1 and LuaFnIsCanDoScriptLogic(sceneId,selfId) == 1 then
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
				SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
			end
			
		end
		
		if x001230_g_bHuashaning == 1   then
			-- ��õ�ǰ��ʱ��
			local nNowTime = LuaFnGetCurrentTime()
			if x001230_g_PreTime == 0    then
				x001230_g_PreTime = nNowTime
				return
			end
			-- 1��ÿ���5���ӣ���Ҫ֪ͨ��ң�ǰ3�������ɣ����͸�ȫ����
			if nNowTime > x001230_g_PreTime+300    then
			
				x001230_g_PreTime = nNowTime
				
				--ˢ���ؼ�....
				x001230_GiveMJ( sceneId )
				
				-- ��һ������
				for i=1, 9    do
					for j=1, i   do
						if x001230_g_nMenpaikills[i].kill > x001230_g_nMenpaikills[j].kill   then
							local nTempMenpai = x001230_g_nMenpaikills[j].id
							local nKills = x001230_g_nMenpaikills[j].kill
							x001230_g_nMenpaikills[j].id = x001230_g_nMenpaikills[i].id
							x001230_g_nMenpaikills[j].kill = x001230_g_nMenpaikills[i].kill
							
							x001230_g_nMenpaikills[i].id = nTempMenpai
							x001230_g_nMenpaikills[i].kill = nKills
						end
					end
				end
				
				-- ����ǰ����ع���
				local nMingci = 1
				
				local szStr = "#{HSJL_090113_01}" --"��ɽ֮�ߣ��������ɸ����۷磬Ŀǰ��ʵ���������ڵ�һ�ڶ�������������ɣ��ֱ�Ϊ" zchw

				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[1].id) .. x001230_g_nMenpaikills[1].kill .. "#{HSJL_090113_02}"
				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[2].id) .. x001230_g_nMenpaikills[2].kill .. "#{HSJL_090113_02}"
				szStr = szStr .. x001230_Id2Menpai(x001230_g_nMenpaikills[3].id) .. x001230_g_nMenpaikills[3].kill .. "#{HSJL_090113_03}"
				
				AddGlobalCountNews(sceneId, szStr)
				
			end
		end
	end
	
	-- ��� bIsTime == 0 ,�Ͱ����е����T��ȥ
	if bIsTime == 0   then
		
		if x001230_g_bHuashaning == 1   then
			-- �������ʱ�̣�����ʱ��Ҫ����Ƚ϶ණ����ע�⣡����
			-- 1������˭�ǽ����ʤ���ߣ�����ж�����е�һ���͡��������һ��ʤ����
			--  a�����������е�ɱ����
				x001230_g_bHuashaning = 0
				x001230_g_bEndTime = LuaFnGetCurrentTime()
				
				for i=1, 9    do
					for j=1, i   do
						if x001230_g_nMenpaikills[i].kill > x001230_g_nMenpaikills[j].kill   then
							local nTempMenpai = x001230_g_nMenpaikills[j].id
							local nKills = x001230_g_nMenpaikills[j].kill
							x001230_g_nMenpaikills[j].id = x001230_g_nMenpaikills[i].id
							x001230_g_nMenpaikills[j].kill = x001230_g_nMenpaikills[i].kill
							
							x001230_g_nMenpaikills[i].id = nTempMenpai
							x001230_g_nMenpaikills[i].kill = nKills
						end
					end
				end
				
				local nMax = 0
				
				for i=1, 9   do
					if x001230_g_nMenpaikills[i].kill == x001230_g_nMenpaikills[1].kill   then
						nMax = nMax+1
					end
				end

				-- �ڵõ���ɱ����1��������ȥ���һ�����Ǻǣ���˵�е�ǿX
				local nVMenpai = random(nMax)

				if x001230_g_nMenpaikills[nVMenpai].kill < 1  then
					-- ���λ��Ч����û��ɱ�ˣ���������ʤ����
					return
				end
				
				-- ����ȫ�ֵ����ݣ�ʤ�������ɣ�ע�⣬����+���ر���Ҫ�ģ���Ϊ0��һ����ʼֵ
				LuaFnSetWorldGlobalData(x001230_g_WorldGlobal, x001230_g_nMenpaikills[nVMenpai].id + 10)

				-- ��������ɵ�ͨ��
				local szMenpai = ""
				if x001230_g_nMenpaikills[nVMenpai].id == 0  then
					szMenpai = "������"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 1  then
					szMenpai = "����"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 2  then
					szMenpai = "ؤ��"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 3  then
					szMenpai = "�䵱��"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 4  then
					szMenpai = "������"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 5  then
					szMenpai = "������"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 6  then
					szMenpai = "������"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 7  then
					szMenpai = "��ɽ��"
				elseif x001230_g_nMenpaikills[nVMenpai].id == 8  then
					szMenpai = "��ң��"
				end
				--AddGlobalCountNews( sceneId, "#P�ڱ��컪ɽ�۽����У�#W" .. szMenpai .. "#P��������һ�ĵ�Ŭ�������ڻ�û�ɽ�۽���һ����������Ϊ���������������е������½컪ɽ�۽������ǰ��ÿ��ĵ�һ��ʦ�����񽫻��Ϊ#Y3��#P���顣" )
				
				x001230_g_bMenpai = szMenpai
				-- BroadMsgByChatPipe(sceneId,0,"@*;SrvMsg;SCA:" .. "#P�ڱ��컪ɽ�۽����У�#Y" .. szMenpai .. "#P��������һ�ĵ�Ŭ�������ڻ�û�ɽ�۽���һ����������Ϊ���������������е������½컪ɽ�۽������ǰ��ÿ��ĵ�һ��ʦ�����񽫻��Ϊ#Y3�����顣",4)

				-- ��¼����ɱ����log
				for i=1, 9   do
					local strLog = "[huashan end]: menpai=" .. tostring(x001230_g_nMenpaikills[i].id) .. "   KillNum=" .. tostring(x001230_g_nMenpaikills[i].kill)
					MissionLog(sceneId,strLog)
				end
				
				-- �����ص���ֵ
				for i=1, 9  do
					x001230_g_nMenpaikills[i].id = i-1
					x001230_g_nMenpaikills[i].kill = 0
				end
				
				-- �������е����ɱ����
				for i=1, x001230_g_PlayerNum   do
					for j=1, i   do
						-- local	objid = LuaFnGuid2ObjId( sceneId, x001230_g_PlayerId[i] )
						
						-- if objid == -1 then											-- �Ҳ��������
							-- PrintNum(i)
						-- end
						if x001230_g_PlayerKc[i] > x001230_g_PlayerKc[j]  then
							local Killcount = x001230_g_PlayerKc[i]
							local KillName  = x001230_g_PlayerName[i]
							local KillMenpai  = x001230_g_PlayerMenpai[i]
							local UserId  = x001230_g_PlayerId[i]
							
							x001230_g_PlayerKc[i] = x001230_g_PlayerKc[j]
							x001230_g_PlayerName[i] = x001230_g_PlayerName[j]
							x001230_g_PlayerMenpai[i] = x001230_g_PlayerMenpai[j]
							x001230_g_PlayerId[i] = x001230_g_PlayerId[j]
							
							x001230_g_PlayerKc[j] = Killcount
							x001230_g_PlayerName[j] = KillName
							x001230_g_PlayerMenpai[j] = KillMenpai
							x001230_g_PlayerId[j] = UserId
						end
					end
				end
				
				-- [ QUFEI 2007-07-27 17:24 UPDATE ]
				-- �������ǰ�������������
				local num = {}
				for i=0 ,8  do
					num[i] = 0
				end

				for i=1, x001230_g_PlayerNum   do
					for j=0, 8   do
						if x001230_g_PlayerMenpai[i] == j then
								if num[j] == 0 then
									x001230_g_nMenpaiQiansan[j+1].player01 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid01 = x001230_g_PlayerId[i]
									num[j] = 1
								elseif num[j] == 1 then
									x001230_g_nMenpaiQiansan[j+1].player02 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid02 = x001230_g_PlayerId[i]
									num[j] = 2
								elseif num[j] == 2 then
									x001230_g_nMenpaiQiansan[j+1].player03 = x001230_g_PlayerName[i]
									x001230_g_nMenpaiQiansan[j+1].playerid03 = x001230_g_PlayerId[i]
									num[j] = 3
								end																							
						end					
					end
				end
				
				--��ѯ����־
				local strLogCheck = format(	"HuaShanLunJian_Rank_All    no.1=(id=%X, name=%s), no.2=(id=%X, name=%s), no.3=(id=%X, name=%s), ",
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[1]),x001230_g_PlayerName[1],
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[2]),x001230_g_PlayerName[2],
											LuaFnGetGUID(sceneId, x001230_g_PlayerId[3]),x001230_g_PlayerName[3]
											)
				LuaFnLogCheck(strLogCheck)
				for i=1, 9  do					
					strLogCheck = format(	"HuaShanLunJian_Rank_MenPai(%s)    no.1=(id=%X, name=%s), no.2=(id=%X, name=%s), no.3=(id=%X, name=%s), ",
											x001230_Id2Menpai(x001230_g_nMenpaiQiansan[i].id),
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01),x001230_g_nMenpaiQiansan[i].player01,
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02),x001230_g_nMenpaiQiansan[i].player02,
											LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03),x001230_g_nMenpaiQiansan[i].player03
											)
					LuaFnLogCheck(strLogCheck)	
					AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid01)
				  AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid02)
          AuditHuashanThreeWinners(sceneId,x001230_g_nMenpaiQiansan[i].playerid03)
				end		
								
				-- ������ɣ���ʼ����
				local mingci = 1
				local KillCounts = 0
				local str = ""
				local mailStr = ""
				for i=1, x001230_g_PlayerNum  do
				
					if mingci == 1 and x001230_g_PlayerName[i] ~= "" then
						-- str = "��һ����" .. x001230_g_PlayerName[i]
						mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵ�һ��!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"
						
						local StartTime = LuaFnGetCurrentTime()
												
						x001230_g_bMenpai = szMenpai
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- ����ִ���ʼ���ǰ�������
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 1)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.1=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 1 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )

						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.1=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)
						
						mingci = 2
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 2
						end
					elseif mingci == 2 and x001230_g_PlayerName[i] ~= "" then
						-- str = "�ڶ�����" .. x001230_g_PlayerName[i]
						mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵڶ���!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"

						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- ����ִ���ʼ���ǰ�������
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 2)

						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.2=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 2 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.2=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)

						mingci = 3
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 3
						end
						
					elseif mingci == 3 and x001230_g_PlayerName[i] ~= "" then
						-- str = "��������" .. x001230_g_PlayerName[i]
						mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵ�����!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"

						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						-- ����ִ���ʼ���ǰ�������
						LuaFnSendScriptMail( sceneId, x001230_g_PlayerName[i], MAIL_HUASHANJIANGLI, nData, 1, 3)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    FULL_NO.3=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i], nData, 1, 3 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_PlayerName[i], mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    FULL_NO.3=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_PlayerId[i]), x001230_g_PlayerName[i] )
						LuaFnLogCheck(strLogCheck)

						mingci = 4
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 4
						end
						
					elseif mingci == 4  then
						-- str = "��������" .. x001230_g_PlayerName[i]
						mingci = 5
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 5
						end
						
					elseif mingci == 5  then
						-- str = "��������" .. x001230_g_PlayerName[i]
						mingci = 6
						if x001230_g_PlayerKc[i] ~= x001230_g_PlayerKc[i+1]  then
							mingci = 6
							break
						end
					end
					-- PrintStr(str)
					-- AddGlobalCountNews( sceneId, str)

				end

				for i=1, 9  do
					--��ÿ�����ɷ���ǰ���������ɹ���
					str = "#P���λ�ɽ�۽��Ѿ���������λͬ��Ϊ��������ǰ�ͺ�̣���ս���б������£�����֮�л�����ߵ��ǣ�#W"
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid01)
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid02)
					-- PrintNum(x001230_g_nMenpaiQiansan[i].playerid03)
					if x001230_g_nMenpaiQiansan[i].playerid01 ~= 0 and x001230_g_nMenpaiQiansan[i].player01 ~= "" then
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid01, str, 7)
						str = "��һ����" .. x001230_g_nMenpaiQiansan[i].player01
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid01, str, 7)	
					end
					
					if x001230_g_nMenpaiQiansan[i].playerid02 ~= 0 and x001230_g_nMenpaiQiansan[i].player02 ~= "" then
						str = "�ڶ�����" .. x001230_g_nMenpaiQiansan[i].player02
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid02, str, 7)			
					end
					
					if x001230_g_nMenpaiQiansan[i].playerid03 ~= 0 and x001230_g_nMenpaiQiansan[i].player03 ~= "" then
						str = "��������" .. x001230_g_nMenpaiQiansan[i].player03
						BroadMsgByChatPipe(sceneId,x001230_g_nMenpaiQiansan[i].playerid03, str, 7)							
					end
					
					if x001230_g_nMenpaiQiansan[i].player01 ~= ""
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player01 ~= x001230_g_PlayerName[3] then
						mailStr = "��ϲ����ñ��컪ɽ�۽������ɵ�һ��!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"
																
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--����ִ���ʼ���ǰ�������																		
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player01, MAIL_HUASHANJIANGLI, nData, 2, 1)

						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.1=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01), x001230_g_nMenpaiQiansan[i].player01, nData, 2, 1 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player01, mailStr )

						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.1=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid01), x001230_g_nMenpaiQiansan[i].player01 )
						LuaFnLogCheck(strLogCheck)

					end
					if x001230_g_nMenpaiQiansan[i].player02 ~= ""
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player02 ~= x001230_g_PlayerName[3] then						
						mailStr = "��ϲ����ñ��컪ɽ�۽������ɵڶ���!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--����ִ���ʼ���ǰ�������												
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player02, MAIL_HUASHANJIANGLI, nData, 2, 2)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.2=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02), x001230_g_nMenpaiQiansan[i].player02, nData, 2, 2 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player02, mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.2=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid02), x001230_g_nMenpaiQiansan[i].player02 )
						LuaFnLogCheck(strLogCheck)

					end				
					if x001230_g_nMenpaiQiansan[i].player03 ~= ""
						and	x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[1] 
						and x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[2] 
						and x001230_g_nMenpaiQiansan[i].player03 ~= x001230_g_PlayerName[3] then						
						mailStr = "��ϲ����ñ��컪ɽ�۽������ɵ�����!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��1��Сʱ��������1��Сʱ��δ��ȡ������ֻ���´��ټ��Ϳ�!��ȡ����֮ǰ���ȵ��ȷ�Ͻ���ѡ���ȡ�콱�ʼ��󣬵����ȡ��ɽ�۽����������콱�ɹ���"
						
						local StartTime = LuaFnGetCurrentTime()
						
						local nMonth = LuaFnGetThisMonth()
						local nDay   = LuaFnGetDayOfThisMonth()
						local nData  = (nMonth+1)*100+nDay						
						--����ִ���ʼ���ǰ�������
						LuaFnSendScriptMail( sceneId, x001230_g_nMenpaiQiansan[i].player03, MAIL_HUASHANJIANGLI, nData, 2, 3)
						
						strLogCheck = format(	"HuaShanLunJian_ScriptMail    MenPai_NO.3=(id=%X, name=%s, Param01=%d, Param02=%d, Param03=%d)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03), x001230_g_nMenpaiQiansan[i].player03, nData, 2, 3 )
						LuaFnLogCheck(strLogCheck)

						LuaFnSendSystemMail( sceneId, x001230_g_nMenpaiQiansan[i].player03, mailStr )
						
						strLogCheck = format(	"HuaShanLunJian_SystemMail    MenPai_NO.3=(id=%X, name=%s)", LuaFnGetGUID(sceneId, x001230_g_nMenpaiQiansan[i].playerid03), x001230_g_nMenpaiQiansan[i].player03 )
						LuaFnLogCheck(strLogCheck)

					end									
				end						

				-- ����������
				for i=1, x001230_g_PlayerNum   do
					x001230_g_PlayerKc[i] = 0										
				end				
				
		end
		
		local i
		for i=0, nHumanNum-1  do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
			  BeginEvent(sceneId)
			  	AddText(sceneId, "#P��ɽ�۽��������")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
		
				local nMenpaiScene
				local nPos_X
				local nPos_Z
				local nMempai = LuaFnGetMenPai(sceneId, nHumanId)
				if 		 nMempai == 0    then
					nMenpaiScene = 9
					nPos_X			 = 62
					nPos_Z			 = 63
				elseif nMempai == 1    then
					nMenpaiScene = 11
					nPos_X			 = 82
					nPos_Z			 = 57
				elseif nMempai == 2    then
					nMenpaiScene = 10
					nPos_X			 = 42
					nPos_Z			 = 145
				elseif nMempai == 3    then
					nMenpaiScene = 12
					nPos_X			 = 99
					nPos_Z			 = 69
				elseif nMempai == 4    then
					nMenpaiScene = 15
					nPos_X			 = 97
					nPos_Z			 = 74
				elseif nMempai == 5    then
					nMenpaiScene = 16
					nPos_X			 = 126
					nPos_Z			 = 77
				elseif nMempai == 6    then
					nMenpaiScene = 13
					nPos_X			 = 37
					nPos_Z			 = 86
				elseif nMempai == 7    then
					nMenpaiScene = 17
					nPos_X			 = 100
					nPos_Z			 = 46
				elseif nMempai == 8    then
					nMenpaiScene = 14
					nPos_X			 = 61
					nPos_Z			 = 69
				elseif nMempai == 9    then
					--û�����ɵ���Ӧ���ǲ����ֵģ����������֣����ø�λ��
					nMenpaiScene = 1
					nPos_X			 = 191
					nPos_Z			 = 138
					--PrintStr("������һ����K�Ķ���֪���Լ������ˣ�����")
				end
				CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, nMenpaiScene, nPos_X, nPos_Z)
			end

		end --END for i=0, nHumanNum-1  do

	end --END if bIsTime == 0

end

--**********************************
-- ɱ�˼���
--**********************************
function x001230_KillPlayer(sceneId, killerId, diedId)
	-- ֻ���ڻʱ����ɱ���˲�����Ч��
	if x001230_g_bHuashaning == 0  then
		return
	end
	
	local IsAddCnt = 1	
	local killerLvl = GetLevel(sceneId, killerId)
	local diedLvl = GetLevel(sceneId, diedId)
	
	local lastplayer = GetMissionData( sceneId, killerId, MD_LASTPLAYER_ID )
	
	if killerLvl - diedLvl >= 40 or lastplayer == diedId then
		IsAddCnt = 0		
	end
	SetMissionData( sceneId, killerId, MD_LASTPLAYER_ID, diedId )
	
	if IsAddCnt == 0 then
		
		BeginEvent(sceneId)
			AddText(sceneId, "�������ظ�ɱ��ͬһ����һ����������ȼ�����40�����������������ɹ��׶Ⱥͻ��ֽ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, killerId)
			
		return 0
	end
	
	-- ��ehuashan_4.lua��Ų���� changed by xindfeng
	local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, killerId)
	SetHumanMenpaiPoint(sceneId, killerId, nMenpaiPoint+1)		--���ɹ��׶�+1
		
	
	local nKillerMenpai = GetMenPai(sceneId, killerId)
	local nKillCount = 0
	
	for i=1, 9  do
		if x001230_g_nMenpaikills[i].id == nKillerMenpai   then
			x001230_g_nMenpaikills[i].kill = x001230_g_nMenpaikills[i].kill + 1
			nKillCount = x001230_g_nMenpaikills[i].kill
		end
	end
	
	-- �����г�����ɱ�����ɵ��˷���Ϣ���������ǵ÷���
	--1����ó����е������ˣ�
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)

	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then

			if nKillerMenpai == GetMenPai(sceneId, PlayerId)    then
				BeginEvent(sceneId)
						AddText(sceneId, "�����ɵ�ǰ�÷֣�" .. nKillCount)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId, PlayerId)
			end

		end
	end
	
	-- ��¼����ɱ����log
	local strLog = "[huashan]: menpai=" .. tostring(nKillerMenpai) .. "   KillNum=" .. tostring(nKillCount)
	MissionLog(sceneId,strLog)

	-- ����ҵ�ɱ��������
	local KillerName = GetName(sceneId, killerId)
	local nIndex = 0
	for i=0, x001230_g_PlayerNum  do
		if KillerName == x001230_g_PlayerName[i]  then
			-- �ҵ�����
			x001230_g_PlayerKc[i] = x001230_g_PlayerKc[i]+1
			BeginEvent(sceneId)
				AddText(sceneId, "#{HSLJJF_1}" .. x001230_g_PlayerKc[i].."#{HSLJJF_2}")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, killerId)
			return
		end
	end
	
	x001230_AddPlayer(sceneId, KillerName, killerId)

end

--**********************************
-- ����һ����ҵ�ɱ���б���ȥ
--**********************************
function x001230_AddPlayer(sceneId, Name, PlayerId)
	
	for i=1, x001230_g_PlayerNum  do
		if Name == x001230_g_PlayerName[i]  then
			return
		end
	end
	
	x001230_g_PlayerNum = x001230_g_PlayerNum + 1;
	x001230_g_PlayerKc[x001230_g_PlayerNum] = 1
	BeginEvent(sceneId)
		AddText(sceneId, "#{HSLJJF_1}1#{HSLJJF_2}")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, PlayerId)
	x001230_g_PlayerName[x001230_g_PlayerNum] = Name
	x001230_g_PlayerId[x001230_g_PlayerNum] = PlayerId
	
	--[ QUFEI 2007-07-27 15:04 UPDATE ]
	--�����ҵ�����ID
	x001230_g_PlayerMenpai[x001230_g_PlayerNum] = GetMenPai(sceneId, PlayerId)

end

--**********************************
-- ����һ����ҵ�ɱ���б���ȥ
--**********************************
function x001230_Id2Menpai(nMenpaiId)
	local szMenpai = ""
	if nMenpaiId == 0  then
		szMenpai = "������"
	elseif nMenpaiId == 1  then
		szMenpai = "����"
	elseif nMenpaiId == 2  then
		szMenpai = "ؤ��"
	elseif nMenpaiId == 3  then
		szMenpai = "�䵱��"
	elseif nMenpaiId == 4  then
		szMenpai = "������"
	elseif nMenpaiId == 5  then
		szMenpai = "������"
	elseif nMenpaiId == 6  then
		szMenpai = "������"
	elseif nMenpaiId == 7  then
		szMenpai = "��ɽ��"
	elseif nMenpaiId == 8  then
		szMenpai = "��ң��"
	end
	
	return szMenpai
	
end

--**********************************
--�Ի�����ʾ
--**********************************
function x001230_MyMsgBox( sceneId, selfId, str )
	BeginEvent(sceneId)    
    AddText(sceneId,str);
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)	
end

--**********************************
--ˢ���ؼ�
--**********************************
function x001230_GiveMJ( sceneId )

	-- ��ɾ���ɵ��ؼ�....
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x001230_g_MJNameTbl)  do
			if szName == x001230_g_MJNameTbl[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end

	--��������ˢ��2��....
	for i=1, getn(x001230_g_MJPosA)  do
		local Rand = random(getn(x001230_g_MJTblA))
		LuaFnCreateMonster(sceneId, x001230_g_MJTblA[Rand],
																x001230_g_MJPosA[i].x, x001230_g_MJPosA[i].y,
																3, 0, x001230_g_MJScript )

	end

	--��������ˢ��4��....

		--����Ȩֵ....
	for i=1, getn(x001230_g_MJPosB) do
		x001230_g_MJPosB[i].rand = random(100)
	end

		--ѡ��Ȩֵ����4������ΪͶ���ؼ��ĵ�....
	for i=1, 4 do

		local MaxVal = -1
		local index = 1

		for j=1, getn(x001230_g_MJPosB) do
			if x001230_g_MJPosB[j].rand > MaxVal then
				MaxVal = x001230_g_MJPosB[j].rand
				x001230_g_MJPosB[j].rand = -1
				index = j
			end
		end

		--Ͷ���ؼ�....
		local Rand = random(getn(x001230_g_MJTblB))
		LuaFnCreateMonster(sceneId, x001230_g_MJTblB[Rand],
																x001230_g_MJPosB[index].x, x001230_g_MJPosB[index].y,
																3, 0, x001230_g_MJScript )

	end


end
