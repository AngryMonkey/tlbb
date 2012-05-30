--ɱ�֣��ڽ������ͬʱ������Ҫɱ�Ĺ�
--÷�� �������

--MisDescBegin
--�ű���
x212113_g_ScriptId = 212113

--�����
x212113_g_MissionId = 678

--ǰ�������
x212113_g_PreMissionId1 = 673
x212113_g_PreMissionId2 = 674
x212113_g_PreMissionId3 = 675

--Ŀ��NPC
x212113_g_Name	="�¼�"

--�������
x212113_g_MissionKind = 44

--����ȼ�
x212113_g_MissionLevel = 70

--�Ƿ��Ǿ�Ӣ����
x212113_g_IfMissionElite = 0

--������
x212113_g_MissionName="�������"
--��������
x212113_g_MissionInfo="#{Mis_K_Meiling_1000183}"
--����Ŀ��
x212113_g_MissionTarget="    ÷����¼�#{_INFOAIM192,70,33,�¼�}Ҫ����ɱ���ϰ׻���С�ģ�ֻҪ�¼���ʼ���룬#R�ϰ׻�#W�ͻ���֡�"		
--δ��������npc�Ի�
x212113_g_ContinueInfo="  ���Ѿ�ɱ���ϰ׻�����"
--�ύʱnpc�Ļ�
x212113_g_MissionComplete="  лл�㣬лл�㡣�ȿȡ�����û�£�ÿ�μ����ܻ�����һЩ�����ġ���"		

x212113_g_MoneyBonus=51700
x212113_g_exp=37000

x212113_g_szMonsterName = "�ϰ׻�"
x212113_g_MonsterID = 525

x212113_g_Custom	= { {id="��ɱ���ϰ׻�",num=1} }
x212113_g_IsMissionOkFail = 0

x212113_g_RadioItemBonus={{id=10412072 ,num=1},{id=10403056,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212113_OnDefaultEvent( sceneId, selfId, targetId )

  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212113_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x212113_g_MissionName)
			AddText(sceneId, x212113_g_ContinueInfo)
		EndEvent( )
		local bDone = x212113_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId,bDone)
				
	--���������������
  elseif x212113_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212113_g_MissionName)
			AddText(sceneId,x212113_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212113_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212113_g_MoneyBonus )
			for i, item in x212113_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212113_OnEnumerate( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212113_g_MissionId) > 0 then
		AddNumText(sceneId, x212113_g_ScriptId, x212113_g_MissionName, 2, -1);
	--���������������
	elseif x212113_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212113_g_ScriptId, x212113_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x212113_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�3��ǰ������
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId1) <= 0 then
			return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId2) <= 0 then
			return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId3) <= 0 then
			return 0
	end
	
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) < x212113_g_MissionLevel then
		return 0
	end
	
	return 1
	
end

--**********************************
--����
--**********************************
function x212113_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 then
		return 
	end
		
	-- �ȼ���ͼ���ǲ���������֣�����оͲ��ٷų���
	local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "�ϰ׻�"  then
			BeginEvent(sceneId)
				strText = "���ڻ����ܽ��������"
				AddText(sceneId, strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end

	-- ������������б�
	local ret = AddMission( sceneId,selfId, x212113_g_MissionId, x212113_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������ĳ�����ź�����λ��
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212113_g_MissionId)--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	Msg2Player(  sceneId, selfId,"#Y��������" .. x212113_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� ".. x212113_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- ��������
	local nMonstrId = LuaFnCreateMonster(sceneId, x212113_g_MonsterID, 189, 71, 1, 0, -1)
	CallScriptFunction((200060), "Paopao",sceneId, "�ϰ׻�", "÷��", "�����ķ��ˣ�����Ϊƾ������С�����������ܹ���������������־��Ϊ������Ḷ�����۰ɣ���������ȴ������ڵģ�")
	SetCharacterDieTime(sceneId, nMonstrId, 600000)
	
end

--**********************************
--����
--**********************************
function x212113_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212113_g_MissionId )
end

--**********************************
--����
--**********************************
function x212113_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212113_g_MissionName)
		AddText(sceneId,x212113_g_MissionComplete)
		AddMoneyBonus( sceneId, x212113_g_MoneyBonus )
		for i, item in x212113_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212113_CheckSubmit( sceneId, selfId )

	local missionId = x212113_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	
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
function x212113_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212113_g_MissionId) <= 0 then
		return
	end
	
	-- 2����������������
	if x212113_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212113_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	if ret > 0  then
		-- ��Ǯ�;���
		AddMoney(sceneId,selfId,x212113_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212113_g_exp)
	
		DelMission( sceneId,selfId, x212113_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId, x212113_g_MissionId )
		AddItemListToHuman(sceneId,selfId)
		
	else
		--������û�мӳɹ�
		BeginEvent(sceneId)
			strText = "��������,�޷��������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x212113_OnKillObject( sceneId, selfId, objdataId ,objId )

	local missionId = x212113_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == x212113_g_szMonsterName   then

		--ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("�Ѿ�սʤ�ϰ׻���1/1" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					-- �����������
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212113_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212113_OnItemChanged( sceneId, selfId, itemdataId )
end







