-- 212132
-- ��į����

-- ֱ�ӽ������������

--MisDescBegin
--�ű���
x212132_g_ScriptId = 212132

--��������NPC����
x212132_g_Position_X=207
x212132_g_Position_Z=212
x212132_g_SceneID=0
x212132_g_AccomplishNPC_Name="˾���"

--�����
x212132_g_MissionId = 254
--ǰ�������
x212132_g_PreMissionId = 349

--Ŀ��NPC
x212132_g_Name	="˾���"

--�������
x212132_g_MissionKind = 55

--����ȼ�
x212132_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212132_g_IfMissionElite = 0

--������
x212132_g_MissionName="��į����"
x212132_g_MissionInfo="#{Mis_Hero_songxin_02}"
x212132_g_MissionTarget="    ���������ҵ�˾���#{_INFOAIM207,212,0,˾���}��"
x212132_g_MissionComplete="  ��Ľ��ʺ���λ���Ѿ���������������Ӣ�۵ĳƺ�ҲԽ��Խ���ˡ�"

x212132_g_MoneyBonus=50000
x212132_g_exp=700000

x212132_g_Custom	= { {id="���ҵ�˾���",num=1} }
x212132_g_IsMissionOkFail = 0

x212132_g_RadioItemBonus={{id=10510047 ,num=1},{id=10515027,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212132_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212132_g_MissionId) > 0)  then
		x212132_OnContinue( sceneId, selfId, targetId )
	
	--���������������
	elseif x212132_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212132_g_MissionName)
			AddText(sceneId,x212132_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212132_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212132_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212132_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212132_g_ScriptId,x212132_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212132_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212132_g_MissionId) > 0 then
		AddNumText(sceneId, x212132_g_ScriptId,x212132_g_MissionName,2,-1);

	--���������������
	elseif x212132_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212132_g_ScriptId,x212132_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212132_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 ) then
		return 0
	end

	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212132_g_MissionLevel then
		return 0
	end	
	
	--���ǰ������
	if IsMissionHaveDone(sceneId, selfId, x212132_g_PreMissionId ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x212132_OnAccept( sceneId, selfId, targetId )
	if x212132_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���30����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ70����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--������������б�
	local ret = AddMission(sceneId,selfId, x212132_g_MissionId, x212132_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ����ˡ�")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y�������񣺼�į���֡�")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212132_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x212132_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212132_g_MissionId )
end

--**********************************
--����
--**********************************
function x212132_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId,x212132_g_MissionName)
		AddText(sceneId,x212132_g_MissionComplete)
		AddMoneyBonus( sceneId, x212132_g_MoneyBonus )
		for i, item in x212132_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212132_g_ScriptId,x212132_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212132_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212132_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212132_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212132_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--���������
		BeginAddItem(sceneId)
		for i, item in x212132_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
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
		
		AddMoney(sceneId,selfId, x212132_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212132_g_exp)
		DelMission( sceneId, selfId, x212132_g_MissionId )
		MissionCom( sceneId, selfId, x212132_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������񣺼�į����",MSG2PLAYER_PARA )

		-- �������ӳƺ�
		LuaFnAwardTitle( sceneId, selfId,  10, 234)
		SetCurTitle(sceneId, selfId,  10, 234)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x212132_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212132_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212132_OnItemChanged( sceneId, selfId, itemdataId )
end

