
-- �޸�[����΢ 2008.5.29 ���,ħ���콫,��Ʒװ���ų���]

-- 210518 ��װ�һ�NPC

-- ��ʦ��

--�ű���
x210518_g_ScriptId = 210518

--��ӵ�е��¼�ID�б�
x210518_g_eventList={}

--�����ʧ�ʶһ�������װ�¼��ű�
x210518_g_MenPaiTaoScriptId = 500617

x210518_g_EquipList={	
--       �·����������������������������������������ף���������
{n=1100,id=30302527},{n=1200,id=30302528},{n=1300,id=30302529},{n=1400,id=30302530},{n=1500,id=30302531},{n=1600,id=30302532},

-- 30�����
{n=2100,id=30504094},{n=2200,id=30504125},{n=2300,id=30504126},{n=2400,id=30504127},{n=2500,id=30504128},{n=2600,id=30309881},{n=2700,id=30309888},

-- 40�����
{n=3100,id=50921001},{n=3200,id=50921002},{n=3300,id=50921003},{n=3400,id=50921004},{n=3500,id=10414024},

-- 50�����
{n=4100,id=10124183},{n=4200,id=10124184},{n=4300,id=10124185},{n=4400,id=10124186},{n=4500,id=10124187},{n=4600,id=10124188},{n=4700,id=10124189},{n=4800,id=10124190},{n=4900,id=10124191},

-- 60�����
{n=5100,id=10433320},{n=5200,id=10433321},{n=5300,id=10433322},{n=5400,id=10433323},{n=5500,id=10414026},{n=5600,id=10415018},

-- 70�����
{n=6100,id=30505706},{n=6200,id=10421012},{n=6300,id=10412012},{n=6400,id=10411012},{n=6500,id=10414027},{n=6600,id=10415019},

-- 80�����
{n=7100,id=10141155},{n=7200,id=10141160},{n=7300,id=10412017},{n=7400,id=10411014},{n=7500,id=10414028},{n=7600,id=10415020},
{n=7100,id=10141156},{n=7200,id=10141161},{n=7300,id=10412018},{n=7400,id=10411015},{n=7500,id=10414029},{n=7600,id=10415021},
{n=7100,id=10141157},{n=7200,id=10141162},
{n=7100,id=10141158},{n=7200,id=10141163},
{n=7100,id=10141159},
-- 90�����
{n=8100,id=10413019},{n=8200,id=10421016},{n=8300,id=10412019},{n=8400,id=10411016},{n=8500,id=10414030},{n=8600,id=10415022},
{n=8100,id=10413020},{n=8200,id=10421017},{n=8300,id=10412020},{n=8400,id=10411017},{n=8500,id=10414031},{n=8600,id=10415023},

-- ����΢��2008.5.29����Ʒװ���ų�������װ����10422016--��¥��	10423024--��¥��
{n=9100,id=10422016},
{n=9100,id=10423024},
}

x210518_g_StoneList={
-- 1��ʯͷ
{n=1,id=39910009,num=50,str="#G��������#W"},
-- 2��ʯͷ
{n=2,id=39910009,num=80,str="#G��������#W"},
-- 3��ʯͷ
{n=3,id=39910009,num=150,str="#G��������#W"},
-- 4��ʯͷ
{n=4,id=39910009,num=200,str="#G��������#W"},
-- 5��ʯͷ
{n=5,id=39910009,num=300,str="#G��������#W"},
-- 6��ʯͷ
{n=6,id=39910009,num=500,str="#G��������#W"},
--80,90�� װ�� ��Ҫ��ʯͷ
{n=7,id=39910009,num=200,str="#G��������#W"},

{n=8,id=30008081,num=120,str="#G��Ϧ�Ļ���#W"},

-- ����΢��2008.5.29����Ʒװ���ų��������һ���Ҫ����Ʒ��20310101--��¥֮��	20310102--��¥֮â
{n=9,id=30503026,num=20,str="#G�����ҳ#W"},
{n=10,id=20310102,num=20,str="��¥֮â"},

}

--**********************************
--�¼��б�
--**********************************
function x210518_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x210518_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText( sceneId, "#e0e8de5#Y��������#W�һ�" )
		AddText( sceneId, "#G��������������#Y��ԭ#cFF0000�Ĵ����#W�����" )
		AddText( sceneId, "#cFF0000�Ĵ����#Yһ��Сʱ#Gˢ��һ�Σ�" )
		AddText( sceneId, "#cFF0000ˢ�º�ϵͳ�Զ���ʾ,#Yÿ��ˢ��#W����һ��#Y20ֻ��#G�ر�����������" )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000������������ͼ", 0, 1000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000���³��ﱦ����", 0, 2000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000�߼�����ڤ��ʯ", 0, 3000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000����������ʱװ", 0, 4000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000�������������", 0, 5000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000�������������", 0, 6000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G����#W�һ�#cFF0000����80��������", 0, 7000 )
		--AddNumText( sceneId, x210518_g_ScriptId, "�һ�90����װ", 0, 8000 )
		--AddNumText( sceneId, x210518_g_MenPaiTaoScriptId, "�һ�ʦ����װ", 0, 846 )
		
		-- ����΢��2008.5.29����Ʒװ���ų���
		--AddNumText( sceneId, x210518_g_ScriptId, "ħ���콵", 0, 9000 )
		--AddNumText( sceneId, x210518_g_ScriptId, "ħ���콵����", 11, 10000 )
		
		AddNumText( sceneId, x210518_g_ScriptId, "�뿪����", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x210518_OnDefaultEvent( sceneId, selfId,targetId )
	x210518_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x210518_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if eventId == x210518_g_MenPaiTaoScriptId then
		if nNumText == 846 then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
			return
		end
	end
	
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #G��ѡ�����һ�����Ʒ��")
				if nNumText < 2000  then
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933������Ƶ�ͼ��", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933ն�Ƕϳ�ǹͼ��", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933������Ԩ��ͼ��", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933ת�����ǹ�ͼ��", 0, nNumText+400)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933���������ͼ��", 0, nNumText+500)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933������Ӱ��ͼ��", 0, nNumText+600)

				end
			if nNumText >= 2000 and nNumText < 3000 then
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000���ﵰ:go��", 0, nNumText+100)
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000���ﵰ:������", 0, nNumText+200)
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000���ﵰ:���~", 0, nNumText+300)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933���ﵰ:��؈˫��", 0, nNumText+400)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933���ﵰ:���ͻ�", 0, nNumText+500)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933���ﵰ:����˫��", 0, nNumText+600)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933���ﵰ:��ʯ��", 0, nNumText+700)

			end
			if nNumText >= 3000 and nNumText < 4000  then
					AddNumText(sceneId, x210518_g_ScriptId, "�һ�#cFF0000��ڤʯ(9��)", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "�һ�#cFF0000��ڤʯ(9��)", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "�һ�#cFF0000��ڤʯ(9��)", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "�һ�#cFF0000��ڤʯ(9��)", 0, nNumText+400)

				end
			if nNumText >= 4000 and nNumText < 5000  then
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000���Ȼ�Ӱ", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000ɽ�˺���", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000�����", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��������", 0, nNumText+400)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000���尢��", 0, nNumText+500)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��������", 0, nNumText+600)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000������ѩ", 0, nNumText+700)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000����ʥ��", 0, nNumText+800)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000���Ӽ���", 0, nNumText+900)

				end
			if nNumText >= 5000 and nNumText < 6000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��Ҥ��[��]", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��Ҥ��[��]", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��Ҥ��[��]", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#cFF0000��Ҥ��[��]", 0, nNumText+400)

				end
			if nNumText >= 6000 and nNumText < 7000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G��#cFF0000��ȱ�����7��", 0, nNumText+100)
				end
			if nNumText >= 7000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#Y80����#cFF0000��", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G�һ�#Y80����#cFF0000��", 0, nNumText+200)
				end
			AddNumText( sceneId, x210518_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 9000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #{JPZB_0610_03}")
			
			local nLevel = 0
			if nNumText > 1000 then
				nLevel = 1
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 3000 then
				nLevel = 3
			end
			if nNumText > 4000 then
				nLevel = 4
			end
			if nNumText > 5000 then
				nLevel = 5
			end
			if nNumText > 6000 then
				nLevel = 6
			end
			if nNumText > 7000 then
				nLevel = 7
			end
			if nNumText > 8000 then
				nLevel = 8
			end
			
			local szStr = "  #{JPZB_0610_04}" .. x210518_g_StoneList[nLevel].str 
										.. "����".. tostring(x210518_g_StoneList[nLevel].num) .. "#{JPZB_0610_05}"
			AddText(sceneId, szStr)
			
			for i, item in x210518_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x210518_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x210518_g_ScriptId, 0)
		
	end
	
	for i, findId in x210518_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	-- ����΢��2008.5.29����Ʒװ���ų������������ť�Ĵ����¼�
	if nNumText == 9000 then
		BeginEvent(sceneId)	
				local szStr = "  #{JPZB_0610_06}"
				AddText(sceneId, szStr)
				for i, item in x210518_g_EquipList do
					if item.n == 9100  then
						AddRadioItemBonus( sceneId, item.id, 4 )
					end
				end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x210518_g_ScriptId, 0)
	end
	-- ħ���콵����
	if nNumText == 10000 then
		BeginEvent(sceneId)	
				AddText( sceneId, "#{JPZB_20080523_01}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x210518_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x210518_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x210518_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x210518_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	if missionScriptId == x210518_g_MenPaiTaoScriptId then
		CallScriptFunction( missionScriptId, "OnMissionSubmit", sceneId, selfId, targetId, missionScriptId, selectRadioId )
		return 0
	end
	
	for i, item in x210518_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x210518_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x210518_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x210518_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 3
	end
	if x210518_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 4
	end
	if x210518_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 5
	end
	if x210518_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x210518_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x210518_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	
	-- ����΢��2008.5.29����Ʒװ���ų���
	if x210518_g_EquipList[nItemIndex].n == 9100 then
		if selectRadioId == 10422016 then
			nLevel = 9
		else 
			if selectRadioId == 10423024 then
				nLevel = 10
			end
		end
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) >= x210518_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_09}"
			end
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) < x210518_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			-- ����΢��2008.5.29����Ʒװ���ų���
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_10}"
			end
			
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- ��鱳���ռ�
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_11}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x210518_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x210518_g_StoneList[nLevel].id, x210518_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_12}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x210518_g_EquipList[nItemIndex].id, 1 );
		
		-- ����΢��2008.5.29����Ʒװ���ų�����������Ʒװ���޷���ף�ǿ�ƿ���
		-- LuaFnEquipLock( sceneId, selfId, nBagIndex )
		
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_13}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x210518_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d#I��#W#{_INFOMSG%s}#I���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x210518_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		-- ����΢��2008.5.29����Ʒװ���ų���
		if nLevel == 9 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		if nLevel == 10 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x210518_OnDie( sceneId, selfId, killerId )
end
