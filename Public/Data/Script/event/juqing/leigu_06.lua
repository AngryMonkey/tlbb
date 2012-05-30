-- ����׽�� 200045 

-- ����������񵽸�����ɱ�֣�Ȼ���������ͬһ��NPC�����о���

--************************************************************************
--MisDescBegin
--�ű���
x200045_g_ScriptId = 200045

--�����
x200045_g_MissionId = 37

--ǰ�������
x200045_g_PreMissionId = 36

--Ŀ��NPC
x200045_g_Name = "���Ǻ�"

--�Ƿ��Ǿ�Ӣ����
x200045_g_IfMissionElite = 1

--����ȼ�
x200045_g_MissionLevel = 60

--�������
x200045_g_MissionKind = 53

--�����ı�����
x200045_g_MissionName="#{MISSIONNAME_JUQING_2}"
x200045_g_MissionInfo="#{Mis_juqing_0037}"
x200045_g_MissionTarget="#{Mis_juqing_Tar_0037}"	--����Ŀ��
x200045_g_MissionContinue="  #{TM_20080313_08}"
x200045_g_MissionComplete="  #{TM_20080313_09}"	--�������npc˵���Ļ�

x200045_g_MoneyBonus=45000
x200045_g_exp=100000

x200045_g_RadioItemBonus={{id=10414016 ,num=1},{id=10415012,num=1},{id=10422011,num=1},{id=10423015,num=1}}

x200045_g_Custom	= { {id="�Ѵ�ܶ�����",num=1} }
x200045_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200045_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --�������Ͳ��Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200045_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200045_g_MissionName)
				AddText(sceneId,x200045_g_MissionContinue)
				--AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
		    EndEvent()
		    local bDone = x200045_CheckSubmit(sceneId, selfId)
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId,bDone)
			end
		end
	
	--���������������
	elseif x200045_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200045_g_MissionName)
			AddText(sceneId,x200045_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200045_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
			for i, item in x200045_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200045_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType == 1 then --���������Ǹ���
			AddNumText(sceneId, x200045_g_ScriptId,x200045_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200045_CheckAccept(sceneId,selfId) > 0 then	
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType ~= 1 then --���������Ǹ���
			AddNumText(sceneId,x200045_g_ScriptId,x200045_g_MissionName,1,-1)
		end
	end

end

--**********************************
--����������
--**********************************
function x200045_CheckAccept( sceneId, selfId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200045_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ60
	if GetLevel(sceneId, selfId) < 60   then
		return 0
	end

	return 1
end


--**********************************
--����
--**********************************
function x200045_OnAccept( sceneId, selfId, targetId )

	if x200045_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200045_g_MissionId, x200045_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#{TM_20080313_02}" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#{TM_20080313_10}",MSG2PLAYER_PARA )

	-- ��������ĵ�0λ��Ϊ0
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	
	-- ���������ϵ���¼�"�������ɱ��"
	SetMissionEvent(sceneId, selfId, x200045_g_MissionId, 0)

end

--**********************************
--����
--**********************************
function x200045_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200045_g_MissionId )
end

--**********************************
--����
--**********************************
function x200045_OnContinue( sceneId, selfId, targetId )
  BeginEvent(sceneId)
	AddText(sceneId,x200045_g_MissionName)
	AddText(sceneId,x200045_g_MissionComplete)
	AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
	for i, item in x200045_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId)
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200045_CheckSubmit( sceneId, selfId, selectRadioId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
	
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1    then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x200045_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0)  then
  	BeginAddItem(sceneId)
		for i, item in x200045_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret < 1 then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		AddMoney(sceneId,selfId,x200045_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200045_g_exp)

		DelMission( sceneId,selfId,  x200045_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200045_g_MissionId )
		Msg2Player(  sceneId, selfId,"#{TM_20080313_11}",MSG2PLAYER_PARA )

		Msg2Player( sceneId, selfId,"#{TM_20080313_12}",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "#{TM_20080313_13}")

		-- ����޹�ɽ���飬��10������
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
		
		-- ֪ͨ��ң�����������ѭ��������
		-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
		local strText1 = "#{LOOTMISSION_MAIL_10}#r#{LOOTMISSION_MAIL_11}#r#{LOOTMISSION_MAIL_12}"
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_05}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200045_OnKillObject( sceneId, selfId, objdataId, objId )

--	if GetName(sceneId,objId) == "������"	  then
--		-- ȡ�������������ӵ�з���Ȩ������
--		local num = GetMonsterOwnerCount(sceneId,objId)
--		for j=0,num-1  do
--			-- ȡ��ӵ�з���Ȩ���˵�objId
--			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
--			-- ��������ǲ������������
--			if IsHaveMission(sceneId, humanObjId, x200045_g_MissionId) > 0 then
--				local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
--				SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
--				BeginEvent(sceneId)
--				AddText(sceneId,"��սʤ�����1/1")
--				EndEvent(sceneId)
--				DispatchMissionTips(sceneId,humanObjId)
--			end
--		end
--	end

end

--**********************************
--���������¼�
--**********************************
function x200045_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200045_OnItemChanged( sceneId, selfId, itemdataId )
	
end




