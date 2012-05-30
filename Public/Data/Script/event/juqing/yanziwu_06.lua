-- �������   Ӣ�۾���

--************************************************************************
--MisDescBegin
--�ű���
x200016_g_ScriptId = 200016

--�����
x200016_g_MissionId = 15

--�����
x200016_g_PreMissionId = 14

--Ŀ��NPC
x200016_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x200016_g_IfMissionElite = 1

--����ȼ�
x200016_g_MissionLevel = 30

--�������
x200016_g_MissionKind = 48

--�����ı�����
x200016_g_MissionName="�������"
x200016_g_MissionInfo="#{Mis_juqing_0015}"
x200016_g_MissionTarget="#{Mis_juqing_Tar_0015}"	--����Ŀ��
x200016_g_MissionComplete="  �������ҵ��ֱ��ܶ��ˡ����еĶ��Ѿ����ˡ�$N���ι��ӣ����ǿ�ȥ����Ѱ�ұ��ɡ�"	--�������npc˵���Ļ�
x200016_g_MissionContinue="  ����ȥ�����ι���ѽ��"

x200016_g_MoneyBonus=27000
x200016_g_exp=32000

x200016_g_RadioItemBonus={{id=10414005 ,num=1},{id=10414006,num=1},{id=10414007,num=1},{id=10414008,num=1}}

x200016_g_DemandItem={{id=40001005,num=1}}		--�ӱ����м���

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200016_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200016_g_MissionName)
			AddText(sceneId,"  ��õ���ҩ��û�а���")
			--AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
		EndEvent( )
		bDone = x200016_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId,bDone)
    --���������������
  elseif x200016_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200016_g_MissionName)
			AddText(sceneId,x200016_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200016_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
			for i, item in x200016_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200016_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200016_g_MissionId) > 0 then
		return
	end

  --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) > 0 then
		AddNumText(sceneId,x200016_g_ScriptId,x200016_g_MissionName,2,-1);
		--���������������
	elseif x200016_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200016_g_ScriptId,x200016_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200016_CheckAccept( sceneId, selfId )
	-- ������û����ɸ�����
	if IsMissionHaveDone(sceneId, selfId, x200016_g_MissionId) > 0 then
		return
	end

	-- �����Ҫ�����ǰ������
  if IsMissionHaveDone(sceneId,selfId,x200016_g_PreMissionId) < 1 then
		return 0
	end
	
	-- ��Ҫ�������е��ڶ������ܽ�
	if LuaFnGetCopySceneData_Param(sceneId, 10) < 2   then
		return 0
	end
	
	--��Ҫ30�����ܽ�
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x200016_OnAccept( sceneId, selfId )
	if x200016_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x200016_g_MissionId, x200016_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺱������",MSG2PLAYER_PARA )

	local nStep = LuaFnGetCopySceneData_Param(sceneId, 10)
	
	if nStep < 3 then
		LuaFnSetCopySceneData_Param(sceneId, 10, 3) --����˵��
		LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())	--ʱ��
		LuaFnSetCopySceneData_Param(sceneId, 13, 1)	--ʱ��
	end

end

--**********************************
--��ʱ�¼�
--**********************************
function x200016_OnTimer(sceneId,selfId)
	--ʱ����ƶ԰�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)			--�õ���������к�
	local nTime = LuaFnGetCurrentTime()
	local nStartTime = GetMissionParam(sceneId,selfId,misIndex,1)

	local nSceneId = GetMissionParam( sceneId,selfId,misIndex,3 )
	if 	nSceneId ~= sceneId    then
		-- ����뿪������������ر�֮
		StopMissionTimer(sceneId,selfId,x200016_g_MissionId)
		return
	end
	
	--�԰ײ��֣���ÿ3��һ�仰��
	local nTimes = GetMissionParam(sceneId,selfId,misIndex,4) -- ����

	if nTime - nStartTime > 5  then
		if nTimes == 1  then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_70}")
			--PrintStr("����")
		elseif nTimes == 2  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_71}")
			--PrintStr("������")
		elseif nTimes == 3  then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_72}")
			--PrintStr("����")
		elseif nTimes == 4  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_73}")
			--PrintStr("������")
		elseif nTimes == 5  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_74}")
			--PrintStr("������")
		elseif nTimes == 6  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_75}")
			--PrintStr("������")
		elseif nTimes == 7  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_76}")
			--PrintStr("������")
		elseif nTimes == 8  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_77}")
			--PrintStr("������")
		elseif nTimes == 9  then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_78}")
			--PrintStr("������")
		elseif nTimes == 10  then
			-- ������ ��ʧ��ͬʱ��ҵõ���ҩ
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "������"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					ItemBoxEnterScene(62,74,-1,sceneId,1,1,40001005)
				end
			end
		end
		
		SetMissionByIndex(sceneId,selfId,misIndex,4,nTimes+1)
		SetMissionByIndex(sceneId,selfId,misIndex,1,nTime)
	end
	
	if nTimes == 11  then
		BeginEvent(sceneId)
		AddText(sceneId,"�������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		
		--�رռ�ʱ��
		StopMissionTimer(sceneId,selfId,x200016_g_MissionId)
		
	end
	
end

--**********************************
--����
--**********************************
function x200016_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200016_g_MissionId )
	DelItem( sceneId, selfId, 40001005, 1 )	

--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200016_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200016_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x200016_g_MissionName)
		AddText(sceneId,x200016_g_MissionComplete)
		AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
		for i, item in x200016_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200016_CheckSubmit( sceneId, selfId )
--	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)
	
--	local bOk = GetMissionParam(sceneId,selfId,misIndex,0)
--	if bOk == 0    then
--		return 0
--	end

	--1, �Ƿ����������
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) < 1 then
		return 0;
	end
	
	--2, �Ƿ��Ѿ�����������
	if IsMissionHaveDone(sceneId,selfId,x200016_g_MissionId) > 0  then
		return 0;
	end

	--3�������������ǲ�����������Ʒ
	if GetItemCount( sceneId, selfId, 40001005 ) < 1    then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200016_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200016_CheckSubmit( sceneId, selfId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200016_g_RadioItemBonus do
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

		if DelMission( sceneId, selfId, x200016_g_MissionId ) ~= 1 then
			return
		end

		MissionCom( sceneId, selfId, x200016_g_MissionId )

		if DelItem( sceneId, selfId, 40001005, 1 ) ~= 1 then
			return
		end
		
		AddItemListToHuman(sceneId,selfId)

		--���������
		AddMoney(sceneId,selfId, x200016_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200016_g_exp)

		Msg2Player( sceneId, selfId, "#Y������񣺱������", MSG2PLAYER_PARA )

	
		Msg2Player( sceneId, selfId,"���Ѿ������#G������#Wϵ������",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "���Ѿ������#G������#Wϵ���������ڴﵽ40��֮���ڴ�����ҵ�����ʦ������#G����ׯ#Wϵ������")
		
		-- �����������飬��10������
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
		
		-- ֪ͨ��ң�����������ѭ��������
		-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
		local strText1 = "#{LOOTMISSION_MAIL_05}#r#{LOOTMISSION_MAIL_06}#r#{LOOTMISSION_MAIL_07}"		
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_02}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200016_OnKillObject( sceneId, selfId, objdataId ,objId)
end

--**********************************
--���������¼�
--**********************************
function x200016_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200016_OnItemChanged( sceneId, selfId, itemdataId )

end







