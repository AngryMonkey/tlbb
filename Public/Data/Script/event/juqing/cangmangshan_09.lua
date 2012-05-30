-- 200038

-- �������� ���� ���� ��

--MisDescBegin
--�ű���
x200038_g_ScriptId = 200038

--�����
x200038_g_MissionId = 32

--ǰ�������
x200038_g_PreMissionId = 31

--Ŀ��NPC
x200038_g_Name	="����"

--�������
x200038_g_MissionKind = 52

--����ȼ�
x200038_g_MissionLevel = 50

--�Ƿ��Ǿ�Ӣ����
x200038_g_IfMissionElite = 0

--������
x200038_g_MissionName="��������"
--��������
x200038_g_MissionInfo="#{Mis_juqing_0032}"
--����Ŀ��
x200038_g_MissionTarget="#{Mis_juqing_Tar_0032}"		
--�ύʱnpc�Ļ�
x200038_g_MissionComplete="  Ү�ɺ���ؼ����գ�ȫ����������$N����֮������λ����Ү�ɺ��һ�ݣ�"		

x200038_g_MoneyBonus=54000
x200038_g_exp=62400

x200038_g_RadioItemBonus={{id=10422007 ,num=1},{id=10422008,num=1},{id=10422009,num=1},{id=10422010,num=1}}

x200038_g_Custom	= { {id="�ѻ�������ͻ�̫��ز�ãɽ��կ",num=1} }

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x200038_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	if IsHaveMission(sceneId,selfId,x200038_g_MissionId) > 0 then
			--��Ҫ������ɲſ���
			local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)--�õ�������20�������е����к�
			if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --����������
				BeginEvent(sceneId)
					AddText(sceneId,x200038_g_Name)
					AddText(sceneId,x200038_g_MissionComplete)
					AddText(sceneId,"#{M_MUBIAO}#r")
					AddText(sceneId,x200038_g_MissionTarget)
					AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
					for i, item in x200038_g_RadioItemBonus do
						AddRadioItemBonus( sceneId, item.id, item.num )
					end
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)
		end
		
	elseif x200038_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200038_g_MissionName)
			AddText(sceneId, x200038_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId, x200038_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x200038_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200038_g_ScriptId,x200038_g_MissionId)
	end	
end

--**********************************
--�о��¼�
--**********************************
function x200038_OnEnumerate( sceneId, selfId, targetId )

	-- ���ǰ������1û����ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId) <= 0   then
		return
	end
	-- ����������Ѿ���ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0 then
   	return
	--���������������
	elseif IsHaveMission(sceneId, selfId, x200038_g_MissionId) > 0 then

		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,2,-1);
			--EndEvent()	
			DispatchEventList(sceneId, selfId, targetId)
		end
		
	--���������������
  elseif x200038_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,1,-1);
			--EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
		end
  end
end

--**********************************
-- 
--**********************************
function x200038_OnLockedTarget( sceneId, selfId, targetId )

end

--**********************************
--����������
--**********************************
function x200038_CheckAccept( sceneId, selfId )
	-- ������������ǣ�����ﵽ20�����ϣ����������ǰ������
	
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200038_g_MissionId) > 0 ) then
		return 0
	end

	if GetLevel(sceneId, selfId) < x200038_g_MissionLevel   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200038_OnAccept( sceneId, selfId, targetId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x200038_g_MissionId, x200038_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y����������������" , MSG2PLAYER_PARA )
	
	-- ����������һ�����ͣ�
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 10  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 10)
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	end

end

--**********************************
--����
--**********************************
function x200038_OnAbandon( sceneId, selfId )
  --������npc˲�ƻ�ԭ��λ��
  DelMission(sceneId, selfId, x200038_g_MissionId)
  
end

--**********************************
--����
--**********************************
function x200038_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200038_g_Name)
		AddText(sceneId,x200038_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200038_g_MissionTarget)
		AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		for i, item in x200038_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200038_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--�ύ
--**********************************
function x200038_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- ����ǲ�������������������
	if x200038_CheckSubmit(sceneId, selfId) < 1 then 
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200038_g_RadioItemBonus do
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
	
	--���������
	AddMoney(sceneId,selfId, x200038_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200038_g_exp)

	DelMission( sceneId,selfId, x200038_g_MissionId )
	--���������Ѿ�����ɹ�
	MissionCom( sceneId,selfId, x200038_g_MissionId )
	Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )

	Msg2Player( sceneId, selfId,"���Ѿ������#G��ãɽ#Wϵ������",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "���Ѿ������#G��ãɽ#Wϵ���������ڴﵽ60��֮���ڴ�����ҵ�����ʦ������#G�޹�ɽ#Wϵ������")

	-- ��ɲ�ãɽ���飬��10������
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- ֪ͨ��ң�����������ѭ��������
	-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
	local strText1 = "#{LOOTMISSION_MAIL_09}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_04}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

function x200038_OnHumanDie(sceneId, selfId)

end

--**********************************
--��ʱ�¼�
--**********************************
function x200038_OnTimer(sceneId,selfId)

end
