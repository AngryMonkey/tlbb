
--�ű��ʼ��Ľű��ļ�

--�ű���
x888889_g_scriptId = 888889


function x888889_ExecuteMail( sceneId, selfId, param0, param1, param2, param3 )

	--CallScriptFunction(DEBUGHOOK_SCRIPT, "DebugBegin", sceneId)

	if param0 == MAIL_REPUDIATE then
		x888889_Mail_Repudiate( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_BETRAYMASTER then
		x888889_Mail_BetrayMaster( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_EXPELPRENTICE then
		x888889_Mail_ExpelPrentice( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_UPDATE_ATTR then
		LuaFnUpdateAttr(sceneId, selfId, param0, param1, param2, param3)
	elseif param0 == MAIL_UNSWEAR then
		x888889_Mail_Unswear(sceneId, selfId, param0, param1, param2, param3)
	elseif param0 == MAIL_PRENTICE_EXP then
		x888889_Mail_PrenticeProfExp(sceneId, selfId, param0, param1, param2, param3)
	elseif param0 == MAIL_COMMISIONSHOP then
		x888889_Mail_CommisionShop( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_HUASHANJIANGLI then
		x888889_Mail_HuaShanJiangLi( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_SHITUPRIZE then
		x888889_Mail_ShiTuPrize( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_SHITUPRIZE_GOODBAD then
		x888889_Mail_Prize_ExpAndGoodBad( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MIAL_SHITU_CHUSHI then
		x888889_Mail_ShiTuChuShi( sceneId, selfId, param0, param1, param2, param3 )
	elseif param0 == MAIL_FINDFRIEND_DELINFO then
		x888889_FindFriendDelInfo( sceneId, selfId, param0, param1, param2, param3 )
	end


	--CallScriptFunction(DEBUGHOOK_SCRIPT, "DebugEnd", sceneId)

end


--���NPCû�������������Ϳ�ִ���ʼ���ʾ��Ϣ
--û�ҵ�
function x888889_NoScriptTypeMail( sceneId, selfId, scripttype)

	if scripttype == MAIL_COMMISIONSHOP then
		x888889_NotifyFailBox( sceneId, selfId, -1, "    �Բ�������ǰû�п���ȡ��Ԫ�����ҡ�" )
	elseif scripttype == MAIL_SHITUPRIZE then
		x888889_NotifyFailBox( sceneId, selfId, -1, "    ��û�н�ȯ������ȡ����ȥ�������ͽ�ܺú������ɣ�" )
	elseif scripttype == MAIL_HUASHANJIANGLI then
		x888889_NotifySystemMsg( sceneId, selfId, "#{HSLJ20080221_01}")
	end
end

--�ҵ���
function x888889_FindScriptTypeMail( sceneId, selfId, scripttype)

	if scripttype == MAIL_COMMISIONSHOP then
		x888889_NotifyFailBox( sceneId, selfId, -1, "    ����Ԫ���ͽ���Ѿ��ɹ���ȡ��������ʼ���" )
	elseif scripttype == MAIL_SHITUPRIZE then
		--x888889_NotifyFailBox( sceneId, selfId, -1, "    ������ʦ�齱��صĽ�Ʒ�Ѿ��ɹ���ȡ������ա�" )
	elseif scripttype == MAIL_HUASHANJIANGLI then
		x888889_NotifySystemMsg( sceneId, selfId, "#{HSLJ20080221_02}")
	end
end

--�¼��б���ʾ
function x888889_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--����ͽ�ܳ�ʦ
function x888889_Mail_ShiTuChuShi( sceneId, selfId, command, PrenticeGuid, zero, zero )
	
	--����ͽ��
	LuaFnExpelPrentice( sceneId, selfId, PrenticeGuid )
	--LuaFnShiTuChuShi( sceneId, selfId,PrenticeGuid )
end



--ͽ�ܸ�ʦ��������ƶ�ֵ
function x888889_Mail_Prize_ExpAndGoodBad( sceneId, selfId, command, PrenticeGuid, Exps, GoodBad )
	--PrenticeGuid����selfId��Exps��ô�ྭ��
	if Exps > 0 then
		LuaAddPrenticeProExp( sceneId, selfId, PrenticeGuid, Exps )
	end
	
	--��ʦ������ƶ�ֵ
	if GoodBad > 0 then
		local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )
		LuaFnSetHumanGoodBadValue( sceneId, selfId, gb_value + GoodBad )
	end
end

--ͽ�ܸ�ʦ������
function x888889_Mail_PrenticeProfExp( sceneId, selfId, command, PrenticeGuid, Exps, zero )
	--PrenticeGuid����selfId��Exps��ô�ྭ��
	if Exps > 0 then
		LuaAddPrenticeProExp( sceneId, selfId, PrenticeGuid, Exps )
	end
end

function x888889_Mail_Unswear( sceneId, selfId, command, betrayerGuid, alldismiss, zero )

	--(1) ���ͺ��Ѷ�
	local FriendPoint = LuaFnGetFriendPointByGUID( sceneId, selfId, betrayerGuid )
	if FriendPoint > 500 then
		LuaFnSetFriendPointByGUID( sceneId, selfId, betrayerGuid, 500 )
	end

	--(2) ȡ�����
	LuaFnUnswear( sceneId, selfId, betrayerGuid )

	--(3) ���ȫ����ɢ����ɾ���ƺ�
	if tonumber(alldismiss) == 1 then
		AwardJieBaiTitle( sceneId, selfId, "" )
		DispatchAllTitle( sceneId, selfId )
	end
end

function x888889_Mail_Repudiate( sceneId, selfId, param0, param1, param2, param3 )
	if not param1 or param1 == -1 then
		return
	end

	if param1 < 0 then
		param1 = 4294967296 + param1
	end

	SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )

	-- ���������ͬ�� GUID �򲻽���ǿ����鴦��
	if param1 ~= 0 and param1 ~= SpouseGUID then
		return
	end

	--ɾ���ƺţ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--ɾ����������
	Skills = {260, 261, 262, 263, 264, 265, 266, 267, 268 }
	for i, skillId in Skills do
		DelSkill( sceneId, selfId, skillId )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, selfId, skillId )
	end
	
	--ɾ����Ӱ���뼼��
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, selfId, skillId )
	end

	--���ӽ�ǮN=100000��Ϊ������
--LuaFnAddMoney( sceneId, selfId, 100000 )

	--����һ����Ʒ��˼����Ϊ������������ռ乻���������ˣ�
--LuaFnBeginAddItem( sceneId )
--LuaFnAddItem( sceneId, 30002002, 1 )
--ret = LuaFnEndAddItem( sceneId, selfId )
--if ret == 1 then
--	LuaFnAddItemListToHuman( sceneId, selfId )
--end

	--�ͶԷ��ĺ��Ѷ����ó�N=X��10��
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	CallScriptFunction(250036, "OnAbandon", sceneId, selfId);
	CallScriptFunction(250037, "OnAbandon", sceneId, selfId);

	--ɾ�����״̬��
	LuaFnDivorce( sceneId, selfId )

end

function x888889_Mail_BetrayMaster( sceneId, selfId, param0, param1, param2, param3 )
	--����ͽ��
	LuaFnExpelPrentice( sceneId, selfId, param1 )
end

function x888889_Mail_ExpelPrentice( sceneId, selfId, param0, param1, param2, param3 )
	--ɾ��ͽ�ܳƺ�
	AwardShiTuTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--�뿪ʦ��
	LuaFnBetrayMaster( sceneId, selfId )
end

function x888889_Mail_CommisionShop( sceneId, selfId, param0, param1, param2, param3 )

	--CSOP1 ~ CSOP8
	--1.����Ԫ��     -- Ԫ������
	--2.����Ԫ��     -- Ԫ�����ӣ���Ǯ����
	--3.����Ԫ������ -- ��Ǯ����
	--4.����Ԫ���˻� -- Ԫ������
	--5.���۽�Ǯ     -- ��Ǯ����
	--6.�����Ǯ     -- Ԫ�����٣���Ǯ����
	--7.���۽�Ǯ���� -- Ԫ������
	--8.���۽�Ǯ�˻� -- ��Ǯ����	

	if param1 == 1 then									-- �˻ؼ��۽�Ǯ
		-- param2 �����к�
		-- param3 ������
		local ret = CSAddBankMoney( sceneId, selfId, param3, "CSOP8" )
		local strAppend = ""
		if ret == 0 then
			return
		else
			if ret == 1 then
				strAppend = ""
			elseif ret == 2 then
				strAppend = "#{Mail_TooMuchMoney}"
			end
		end

		local mailStr = format( "�����۵�#{_MONEY%d}����û���۳��������Ľ�Ǯ�Ѿ��浽���������л�ͷ��%s", param3, strAppend )
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		local logStr = format( "Recvback type:1 sn:%d value:%d", param2, param3 )
		LogCommisionDeal( sceneId, selfId, logStr )
	elseif param1 == 0 then								-- �˻ؼ���Ԫ��
		-- param2 �����к�
		-- param3 ������
		CSAddYuanbao( sceneId, selfId, param3, "CSOP4" )
		local mailStr = format( "�����۵�%d��Ԫ������û���۳����̵��Ѿ�����������������", param3 )
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		local logStr = format( "Recvback type:0 sn:%d value:%d", param2, param3 )
		LogCommisionDeal( sceneId, selfId, logStr )
	elseif param1 == 2 then								-- ���ͼ��۽�Ǯ
		-- param2 �����к�
		-- param3 ������
		local ret = CSAddBankMoney( sceneId, selfId, param3, "CSOP3" )
		local strAppend = ""
		if ret == 0 then
			return
		else
			if ret == 1 then
				strAppend = ""
			elseif ret == 2 then
				strAppend = "#{Mail_TooMuchMoney}"
			end
		end

		local mailStr = format( "�����۵�Ԫ���ɹ����۳�������õ�#{_MONEY%d}�Ѿ������������л�ͷ��%s", param3, strAppend )
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		local logStr = format( "Gain type:1 sn:%d value:%d", param2, param3 )
		LogCommisionDeal( sceneId, selfId, logStr )
	elseif param1 == 3 then								-- ���ͼ���Ԫ��
		-- param2 �����к�
		-- param3 ������
		CSAddYuanbao( sceneId, selfId, param3, "CSOP7" )
		local mailStr = format( "�����۵Ľ�Ǯ�ɹ����۳�������õ�%d��Ԫ���Ѿ��ӵ������ϡ�", param3 )
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		local logStr = format( "Gain type:0 sn:%d value:%d", param2, param3 )
		LogCommisionDeal( sceneId, selfId, logStr )
	end
	
	--��������ļ�������
	DecCommisionNum(sceneId,selfId)
end

function x888889_Mail_HuaShanJiangLi( sceneId, selfId, param0, param1, param2, param3 )
	-- PrintStr(GetName(sceneId, selfId))
	-- PrintNum(param1)
	-- PrintNum(param2)
	-- PrintNum(param3)
	local strLogCheck = ""
	if param2 == 1 then
		if param3 == 1 then			
			-- PrintStr(GetName(sceneId, selfId))
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    FULL_NO.1=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 0, 0, 1, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵ�һ��!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		elseif param3 == 2 then
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    FULL_NO.2=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 0, 1, 0, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵڶ���!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		elseif param3 == 3 then
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    FULL_NO.3=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 0, 1, 1, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽��ܻ��ֵ�����!�������һ�ɽ�۽��������ս��루����193��138����ȡ�����!ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		end
	elseif param2 == 2 then
		if param3 == 1 then
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    MenPai_NO.1=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 1, 0, 0, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽������ɵ�һ��! �������һ�ɽ�۽��������ս��루����193��138����ȡ�����! ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		elseif param3 == 2 then
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 0 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 1 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    MenPai_NO.2=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 1, 0, 1, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽������ɵڶ���! �������һ�ɽ�۽��������ս��루����193��138����ȡ�����! ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		elseif param3 == 3 then
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli01, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli02, 1 )
			SetMissionFlag( sceneId, selfId, MF_LunjianJiangli03, 0 )
			SetMissionData( sceneId, selfId, MD_HUASHANJIANGLI_TIME, param1 )
			
			strLogCheck = format(	"HuaShanLunJian_MissionData    MenPai_NO.3=(id=%X, Param01=%d, Param02=%d, Param03=%d, Param04=%d)", LuaFnGetGUID(sceneId, selfId), 1, 1, 0, param1 )
			LuaFnLogCheck(strLogCheck)
			-- local	mailStr = "��ϲ����ñ��컪ɽ�۽������ɵ�����! �������һ�ɽ�۽��������ս��루����193��138����ȡ�����! ע�⣺��ȡʱ��Ϊ1��Сʱ�����������1��Сʱ��û����ȡ�����Ļ���ֻ���´��ټ��Ϳ�!"
			-- LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), mailStr )
		end	
	end
end

function x888889_Mail_ShiTuPrize( sceneId, selfId, param0, param1, param2, param3 )
	local plevel = param1
	--9999,����λΪ50������ȡ����,����λ99Ϊ40������ȡ����
	local ct = GetMissionData(sceneId, selfId, MD_SHITU_PRIZE_COUNT)
	local c40 = mod(ct,100)
	local c50 = floor(ct/100)

	--��ȡ�������
	if 40 == plevel then
		if 10 < c40+1 then
			x888889_NotifySystemMsg(sceneId,selfId,"��ȡ��ʦ��ȯʧ�ܣ��Ѿ��ﵽ���ޡ�")
			return
		end
	elseif 50 == plevel then
		if 10 < c50+1 then
			x888889_NotifySystemMsg(sceneId,selfId,"��ȡ�ؼ���ʦ��ȯʧ�ܣ��Ѿ��ﵽ���ޡ�")
			return
		end
	end

	--��ȡ����
	local itemId = param2
	local itemNum = param3
	
	LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, itemId, itemNum)
	local ret = LuaFnEndAddItem( sceneId, selfId )
	if 1 == ret then
		--�����Ʒ
		AddItemListToHuman(sceneId,selfId)
		x888889_NotifySystemMsg(sceneId,selfId,"��ȡ��ȯ�ɹ�")
		--�ڳ齱��־�м�¼....
		--��־��ţ����GUID��������֣���ȯ��ƷID
		local logstr = format("PL:%d,0x%X,%s,%d",
									 				PRIZE_LOG_XINSHOUSHITU,
									 				LuaFnGetGUID(sceneId,selfId),
									 				GetName(sceneId,selfId),
									 				itemId)
		LuaFnLogPrize(logstr)
	else
		x888889_NotifySystemMsg(sceneId,selfId,"û���㹻������������ռ䣬��ȡʧ��")
		return
	end
	
	--��ȡ�������޸���ȡ����
	if 40 == plevel then
		SetMissionData( sceneId, selfId, MD_SHITU_PRIZE_COUNT, ct+1)
	elseif 50 == plevel then
		SetMissionData( sceneId, selfId, MD_SHITU_PRIZE_COUNT, (c50+1)*100+c40)
	end
end

function x888889_NotifySystemMsg(sceneId,selfId,tip)
	BeginEvent(sceneId)
		AddText(sceneId,tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end


function x888889_FindFriendDelInfo( sceneId, selfId, param0, param1, param2, param3 )
	local nADType = param1
	local nDelInfoTime = param2
	
	if nADType > 4 or nADType < 1 then
		return
	end
	
	if nADType == 1 then
		SetMissionData(sceneId, selfId, MD_FINDFRIENDAD_DELTIME_MARRY, nDelInfoTime)
	elseif nADType == 2 then
		SetMissionData(sceneId, selfId, MD_FINDFRIENDAD_DELTIME_GUILD, nDelInfoTime)
	elseif nADType == 3 then
		SetMissionData(sceneId, selfId, MD_FINDFRIENDAD_DELTIME_TEACHER, nDelInfoTime)
	elseif nADType == 4 then
		SetMissionData(sceneId, selfId, MD_FINDFRIENDAD_DELTIME_BROTHER, nDelInfoTime)
	end
	
	Audit_FindFriendAD_DelInfo(sceneId, selfId, nADType)

end
