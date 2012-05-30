--ɱ�֣��ڽ������ͬʱ������Ҫɱ�Ĺ�
--����Ŀ���

--MisDescBegin
--�ű���
x212102_g_ScriptId = 212102

--�����
x212102_g_MissionId = 536

--Ŀ��NPC
x212102_g_Name	="³ƽ"

--�������
x212102_g_MissionKind = 30

--����ȼ�
x212102_g_MissionLevel = 48

--�Ƿ��Ǿ�Ӣ����
x212102_g_IfMissionElite = 0

--������
x212102_g_MissionName="����Ŀ���"
--��������
x212102_g_MissionInfo="#{Lua_yanbei_0001}"
--����Ŀ��
x212102_g_MissionTarget="  �㱱��³ƽ#{_INFOAIM271,49,19,³ƽ}Ҫ����սʤС�֡�С�ģ�ֻҪ³ƽһ�����£�#RС��#W�ͻ���֡�"	
--δ��������npc�Ի�
x212102_g_ContinueInfo="  ���Ѿ����С������"
--�ύʱnpc�Ļ�
x212102_g_MissionComplete="  ��˺õ����������ټ��������������Ŷ�����ģ����ȷ���㱱��Ӣ�ۡ�"		

x212102_g_MoneyBonus=4750
x212102_g_exp=19800

--x212102_g_ItemBonus={{id=30102003, num=2}}

x212102_g_szMonsterName = "С��"

x212102_g_Custom	= { {id="��ɱ��С��",num=1} }
x212102_g_IsMissionOkFail = 0

x212102_g_RadioItemBonus={{id=10420068 ,num=1},{id=10421068,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212102_OnDefaultEvent( sceneId, selfId, targetId )

  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x212102_g_MissionName)
			AddText(sceneId, x212102_g_ContinueInfo)
		EndEvent( )
		local bDone = x212102_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId,bDone)
				
	--���������������
  elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212102_g_MissionName)
			AddText(sceneId,x212102_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212102_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
			for i, item in x212102_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212102_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212102_g_MissionId) > 0 then
		AddNumText(sceneId, x212102_g_ScriptId, x212102_g_MissionName, 2, -1);
	--���������������
	elseif x212102_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212102_g_ScriptId, x212102_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x212102_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�ǰ������
	if IsMissionHaveDone(sceneId,selfId,535) <= 0 then		--���Ż���
		return 0
	end
	
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= x212102_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212102_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212102_g_MissionId) > 0 then
		return 
	end
		
	-- ������������б�
	local ret = AddMission( sceneId,selfId, x212102_g_MissionId, x212102_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������ĳ�����ź�����λ��
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212102_g_MissionId)--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	Msg2Player(  sceneId, selfId,"#Y��������" .. x212102_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� " .. x212102_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- �ȼ���ͼ���ǲ���������֣�����оͲ��ٷų���
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "С��"  then
			return
		end
	end
	-- ��������
	LuaFnCreateMonster(sceneId, 521, 272, 53, 1, 0, -1)

end

--**********************************
--����
--**********************************
function x212102_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212102_g_MissionId )
end

--**********************************
--����
--**********************************
function x212102_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212102_g_MissionName)
		AddText(sceneId,x212102_g_MissionComplete)
		AddMoneyBonus( sceneId, x212102_g_MoneyBonus )
		for i, item in x212102_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212102_g_ScriptId,x212102_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212102_CheckSubmit( sceneId, selfId )

	local missionId = x212102_g_MissionId
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
function x212102_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212102_g_MissionId) <= 0 then
		return
	end
	
	-- 2����������������
	if x212102_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212102_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		-- ��Ǯ�;���
		AddMoney(sceneId,selfId,x212102_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212102_g_exp)
		
		DelMission( sceneId,selfId, x212102_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId, x212102_g_MissionId )
		
	else
		--������û�мӳɹ�
		BeginEvent(sceneId)
			AddText(sceneId, "��������,�޷��������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
		
end

--**********************************
--ɱ����������
--**********************************
function x212102_OnKillObject( sceneId, selfId, objdataId ,objId )

	local missionId = x212102_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == x212102_g_szMonsterName   then

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
						local strText = format("�Ѿ�սʤС�֣�1/1" )
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
function x212102_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212102_OnItemChanged( sceneId, selfId, itemdataId )
end







