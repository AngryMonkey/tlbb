
-- �޸�[����΢ 2008.5.29 ���,ħ���콫,��Ʒװ���ų���]

-- 340002 ��װ�һ�NPC

-- ��ʦ��

--�ű���
x340002_g_ScriptId = 340002

--��ӵ�е��¼�ID�б�
x340002_g_eventList={}

--�����ʧ�ʶһ�������װ�¼��ű�
x340002_g_MenPaiTaoScriptId = 500617

x340002_g_EquipList={	
--       �·����������������������������������������ף���������
{n=1100,id=10141145},{n=1200,id=30308094},{n=1300,id=10412001},{n=1400,id=10411001},
--{n=1100,id=30308094},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},

-- 30�����
{n=2100,id=10451149},{n=2200,id=10451150},{n=2300,id=10451151},{n=2400,id=10451152},

-- 40�����
{n=3100,id=10124323},{n=3200,id=10124328},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124324},{n=3200,id=10124329},{n=3300,id=10412003},{n=3400,id=10411003},{n=3500,id=10414020},
{n=3100,id=10124325},{n=3200,id=10124330},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124326},{n=3200,id=10124331},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10124327},

-- 50�����
{n=4100,id=10156020},{n=4200,id=10156007},{n=4300,id=10412010},{n=4400,id=10411010},{n=4500,id=10414025},
{n=4100,id=10156024},{n=4200,id=10156009},{n=4300,id=10412004},{n=4400,id=10411004},{n=4500,id=10414021},
{n=4100,id=10156016},

-- 60�����
{n=5100,id=30503065},{n=5200,id=30503062},{n=5300,id=10412011},{n=5400,id=10411011},{n=5500,id=10414026},{n=5600,id=10415018},
{n=5100,id=30503066},{n=5200,id=30503063},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503067},{n=5200,id=30503064},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503068},{n=5200,id=30503069},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},
{n=5100,id=30503070},

-- 70�����
{n=6100,id=10413012},{n=6200,id=10421012},{n=6300,id=10412012},{n=6400,id=10411012},{n=6500,id=10414027},{n=6600,id=10415019},
{n=6100,id=10413006},{n=6200,id=10421006},{n=6300,id=10412006},{n=6400,id=10411006},{n=6500,id=10414023},{n=6600,id=10415017},
-- 80�����
{n=7100,id=10413017},{n=7200,id=10421014},{n=7300,id=10412017},{n=7400,id=10411014},{n=7500,id=10414028},{n=7600,id=10415020},
{n=7100,id=10413018},{n=7200,id=10421015},{n=7300,id=10412018},{n=7400,id=10411015},{n=7500,id=10414029},{n=7600,id=10415021},
-- 90�����
{n=8100,id=10413019},{n=8200,id=10421016},{n=8300,id=10412019},{n=8400,id=10411016},{n=8500,id=10414030},{n=8600,id=10415022},
{n=8100,id=10413020},{n=8200,id=10421017},{n=8300,id=10412020},{n=8400,id=10411017},{n=8500,id=10414031},{n=8600,id=10415023},

-- ����΢��2008.5.29����Ʒװ���ų�������װ����10422016--��¥��	10423024--��¥��
{n=9100,id=10422016},
{n=9100,id=10423024},
}

x340002_g_StoneList={
-- 1��ʯͷ
{n=1,id=30503093,num=10,str="#G��ԯ��#W"},
-- 2��ʯͷ
{n=2,id=30503093,num=1,str="#G��ԯ��#W"},
-- 3��ʯͷ
{n=3,id=30503087,num=40,str="#G�����Ƭ#W"},
-- 4��ʯͷ
{n=4,id=30503087,num=50,str="#G�����Ƭ#W"},
-- 5��ʯͷ
{n=5,id=30503087,num=60,str="#G�����Ƭ#W"},
-- 6��ʯͷ
{n=6,id=30505192,num=20,str="#G�������#W"},
--80,90�� װ�� ��Ҫ��ʯͷ
{n=7,id=30008081,num=100,str="#G��Ϧ�Ļ���#W"},

{n=8,id=30008081,num=120,str="#G��Ϧ�Ļ���#W"},

-- ����΢��2008.5.29����Ʒװ���ų��������һ���Ҫ����Ʒ��20310101--��¥֮��	20310102--��¥֮â
{n=9,id=30503026,num=20,str="#G�����ҳ#W"},
{n=10,id=20310102,num=20,str="��¥֮â"},

}

--**********************************
--�¼��б�
--**********************************
function x340002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x340002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText( sceneId, "           #e0e8de5#Y����#Wʱװ�һ�" )
		--AddText( sceneId, "ÿ�յ�#Y18��30��22��00#W��չ�����ʼʱ��#G����#W���������#Y��ԯ��ʯ#W���辡���ҵ���������ԯ̨������#G30���Ӻ�#W��ʯ���Զ���ʧ��" )
		--AddText( sceneId, "�����ԯ��ʯ�󣬿���#cFF0000������141��208��#W�������м�����ԯ̨��������ԯ̨��Ҫ#Y15����#W��#cFF0000��;���ܱ�������#W������ԯ̨ʱ���ͬ��Ӧ�ػ����Աߣ�������ԯ̨��#G�����߽�#W����ԯ��ʯҲ�����䡣#Y������ҿ�������ʰȡ�����ٴμ�����" )
		--AddText( sceneId, "�ɹ�������ԯ̨���óɹ������ɻ��#G��������֮��#W����#cFF0000��ԯ��#W���õ�#G��ԯ��#W��ɵ�#YĽ��ɽׯ#W�һ�#Y��������#cFF0000�ռ���ԯ����#W--#Y�ٷ��������" )

		--AddNumText( sceneId, x340002_g_ScriptId, "#G��ԯ��#W�һ�#cFF0000������", 4, 1000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "#G�����Ƭ#W�һ�#cFF0000�߼��������", 0, 2000 )
		AddNumText( sceneId, x340002_g_ScriptId, "#G�������#W�һ�#cFF0000�߼�����ʱװ", 0, 3000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "#G��Ϧ����#W�һ�#cFF0000������������", 0, 4000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "#G�����ҳ#W�һ�#cFF0000120�����ɼ���", 0, 5000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "�һ�70����װ", 0, 6000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "�һ�80����װ", 0, 7000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "�һ�90����װ", 0, 8000 )
		--AddNumText( sceneId, x340002_g_MenPaiTaoScriptId, "�һ�ʦ����װ", 0, 846 )
		
		-- ����΢��2008.5.29����Ʒװ���ų���
		--AddNumText( sceneId, x340002_g_ScriptId, "ħ���콵", 0, 9000 )
		--AddNumText( sceneId, x340002_g_ScriptId, "ħ���콵����", 11, 10000 )

		--AddNumText( sceneId, x340002_g_ScriptId, "��Ҫ�μӾ����ᱦ", 4, 200 )
		
		AddNumText( sceneId, x340002_g_ScriptId, "�뿪����", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x340002_OnDefaultEvent( sceneId, selfId,targetId )
	x340002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x340002_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if eventId == x340002_g_MenPaiTaoScriptId then
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

	if nNumText == 200  then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 5, 69, 57, 10 )
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #G��ѡ�����һ�����Ʒ��")
				if nNumText < 2000  then
					AddNumText(sceneId, x340002_g_ScriptId, "#c009933�һ���ԯ����", 4, nNumText+100)
					AddNumText(sceneId, x340002_g_ScriptId, "#c009933��ԯ��������", 4, nNumText+200)
				end
			if nNumText >= 2000 and nNumText < 3000 then
			AddNumText(sceneId, x340002_g_ScriptId, "#cFF0000�����̣���", 0, nNumText+100)
			AddNumText(sceneId, x340002_g_ScriptId, "#W�����̣�����", 0, nNumText+200)
			AddNumText(sceneId, x340002_g_ScriptId, "#Y�����̣�����", 0, nNumText+300)
			AddNumText(sceneId, x340002_g_ScriptId, "#c009933�����̣�����", 0, nNumText+400)
			end
			if nNumText >= 3000 and nNumText < 4000  then
					AddNumText(sceneId, x340002_g_ScriptId, "�һ�#G�߼�����ʱװ#cFF0000��", 0, nNumText+100)
					AddNumText(sceneId, x340002_g_ScriptId, "�һ�#G�߼�����ʱװ#cFF0000��", 0, nNumText+200)
				end
			if nNumText >= 4000 and nNumText < 5000  then
					AddNumText(sceneId, x340002_g_ScriptId, "#G�һ�#cFF0000��������", 0, nNumText+100)
					AddNumText(sceneId, x340002_g_ScriptId, "#G�һ�#cFF0000�������", 0, nNumText+200)
				end
			if nNumText >= 5000 then
					AddNumText(sceneId, x340002_g_ScriptId, "#G�һ�#cFF0000�ڹ�����", 0, nNumText+100)
					AddNumText(sceneId, x340002_g_ScriptId, "#G�һ�#cFF0000�⹥����", 0, nNumText+200)
				end
			AddNumText( sceneId, x340002_g_ScriptId, "�뿪����", 0, 0 )
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
			if nNumText > 1100 then
				nLevel = 2
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 2100 then
				nLevel = 3
			end
			if nNumText > 2200 then
				nLevel = 4
			end
			if nNumText > 2300 then
				nLevel = 5
			end
			if nNumText > 3000 then
				nLevel = 6
			end
			if nNumText > 4000 then
				nLevel = 7
			end
			if nNumText > 4100 then
				nLevel = 8
			end
			if nNumText > 5000 then
				nLevel = 9
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
			
			local szStr = "  #{JPZB_0610_04}" .. x340002_g_StoneList[nLevel].str 
										.. "����".. tostring(x340002_g_StoneList[nLevel].num) .. "#{JPZB_0610_05}"
			AddText(sceneId, szStr)
			
			for i, item in x340002_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x340002_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x340002_g_ScriptId, 0)
		
	end
	
	for i, findId in x340002_g_eventList do
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
				for i, item in x340002_g_EquipList do
					if item.n == 9100  then
						AddRadioItemBonus( sceneId, item.id, 4 )
					end
				end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x340002_g_ScriptId, 0)
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
function x340002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x340002_g_eventList do
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
function x340002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x340002_g_eventList do
		if missionScriptId == findId then
			x340002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x340002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x340002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x340002_g_eventList do
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
function x340002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	if missionScriptId == x340002_g_MenPaiTaoScriptId then
		CallScriptFunction( missionScriptId, "OnMissionSubmit", sceneId, selfId, targetId, missionScriptId, selectRadioId )
		return 0
	end
	
	for i, item in x340002_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x340002_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x340002_g_EquipList[nItemIndex].n > 1100 then
		nLevel = 2
	end
	if x340002_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x340002_g_EquipList[nItemIndex].n > 2100 then
		nLevel = 3
	end
	if x340002_g_EquipList[nItemIndex].n > 2200 then
		nLevel = 4
	end
	if x340002_g_EquipList[nItemIndex].n > 2300 then
		nLevel = 5
	end
	if x340002_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 6
	end
	if x340002_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 7
	end
	if x340002_g_EquipList[nItemIndex].n > 4100 then
		nLevel = 8
	end
	if x340002_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 9
	end
	if x340002_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x340002_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x340002_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	
	-- ����΢��2008.5.29����Ʒװ���ų���
	if x340002_g_EquipList[nItemIndex].n == 9100 then
		if selectRadioId == 10422016 then
			nLevel = 9
		else 
			if selectRadioId == 10423024 then
				nLevel = 10
			end
		end
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x340002_g_StoneList[nLevel].id) >= x340002_g_StoneList[nLevel].num  then
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
	if LuaFnGetAvailableItemCount(sceneId, selfId, x340002_g_StoneList[nLevel].id) < x340002_g_StoneList[nLevel].num   then
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x340002_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x340002_g_StoneList[nLevel].id, x340002_g_StoneList[nLevel].num)
	
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
		local nBagIndex = TryRecieveItem( sceneId, selfId, x340002_g_EquipList[nItemIndex].id, 1 );
		
		-- ����΢��2008.5.29����Ʒװ���ų�����������Ʒװ���޷���ף�ǿ�ƿ���
		-- LuaFnEquipLock( sceneId, selfId, nBagIndex )
		
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_13}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x340002_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		elseif randMessage == 2 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
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

	for i, findId in x340002_g_eventList do
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
function x340002_OnDie( sceneId, selfId, killerId )
end