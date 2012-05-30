--����NPC
--����

x805009_g_scriptId = 805009
x805009_g_BuildingID1 = 0

--��ӵ�е��¼�ID�б�
x805009_g_eventList = { 600035, 600040 }

-- �����¼� ID �б������¼��������¼�
x805009_g_eventSetList = { 600035, 600040 }

--��Ʊ����ID
x805009_g_TicketItemIdx	=	40002000

-- ��ƱID
x805009_g_Yinpiao = 40002000


-- ���׶��ƺ�
x805009_g_GuildContriTitle = 
{
	{ currName="",	nextId=242, needContri=250, 	name="����ں�"},
	{ currName="����ں�",	nextId=243, needContri=750, 	name="��ͤ��"},
	{ currName="��ͤ��", 	nextId=244, needContri=1500, 	name="�����"},
	{ currName="�����", 	nextId=245, needContri=3000, 	name="���غ�"},
	{ currName="���غ�", 	nextId=246, needContri=7500, 	name="�￤��"},
	{ currName="�￤��", 	nextId=247, needContri=15000, 	name="���ع�"},
	{ currName="���ع�", 	nextId=248, needContri=30000, 	name="�￤��"},
	{ currName="�￤��", 	nextId=249, needContri=60000, 	name="�����"},
	{ currName="�����", 	nextId=250, needContri=125000, 	name="�￤��"},
	{ currName="�￤��", 	nextId=251, needContri=250000, 	name="������"}
}


--**********************************
--�¼��б�
--**********************************
function x805009_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if(Humanguildid == cityguildid) then
--		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			AddText( sceneId, "    ���д�С��������Ҫ���ܰ���ʲô�ģ�һ���ֵܲ��ؿ�����" )

			--AddNumText( sceneId, x805009_g_scriptId, "���ý�����һ��", 6, 1 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý���������", 6, 2 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý���������", 6, 3 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý������ļ�", 6, 4 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý������弶", 6, 5 )

			--AddNumText( sceneId, x805009_g_scriptId, "���ó�����һ��", 6, 6 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó���������", 6, 7 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó���������", 6, 8 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó������ļ�", 6, 9 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó������弶", 6, 10 )

			--AddNumText( sceneId, x805009_g_scriptId, "�������ʷ���", 6, 13 )
			AddNumText( sceneId, x805009_g_scriptId, "����/�鿴��������", 6, 22 )
			AddNumText( sceneId, x805009_g_scriptId, "���н���", 6, 12 )
			AddNumText( sceneId, x805009_g_scriptId, "�����о�", 6, 14 )

			for i, eventId in x805009_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			--AddNumText( sceneId, x805009_g_scriptId, "������", 6, 15 )
			--AddNumText( sceneId, x805009_g_scriptId, "������̹�Ʊ", 7, 16 )
			--AddNumText( sceneId, x805009_g_scriptId, "�������̹�Ʊ", 7, 17 )
			AddNumText( sceneId, x805009_g_scriptId, "��ҵ·��", 12, 18 )
			AddNumText( sceneId, x805009_g_scriptId, "���ý���", 11, 19 )
			AddNumText( sceneId, x805009_g_scriptId, "�����������", 11, 20 )
			AddNumText( sceneId, x805009_g_scriptId, "�о��������", 11, 21 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_02}", 11, 25 )--���ڶһ��ﹱ��
			AddNumText( sceneId, x805009_g_scriptId, "�����Ϊ����", 6, 23 )
			AddNumText( sceneId, x805009_g_scriptId, "#{SQBZ_090205_01}", 11, 26 )
			--AddNumText( sceneId, x805009_g_scriptId, "�ص�����", 9, 11 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090226_10}", 9, 29 )
			local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
			local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
			local guildName = LuaFnGetGuildName(sceneId, selfId);
			for i, titleItem in x805009_g_GuildContriTitle do
				if currGuildContriTitle == "" then
					currGuildContriTitle = guildName
				end
				if currGuildContriTitle == guildName..titleItem.currName then
					AddNumText( sceneId, x805009_g_scriptId, "����Ϊ"..titleItem.name, 6, 30 )
					break;
				end
			end
			
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_01}", 6, 24 )--���ﹱ�һ��ɰﹱ��

		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "��Ů"
			elseif PlayerGender == 1 then
				rank = "����"
			else
				rank = "��λ"
			end

			AddText( sceneId, "    " .. rank .. "�����ý������˱��ǵ����ܣ���ʲô�����ҿ��ԽӴ���͡�" )
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805009_OnDefaultEvent( sceneId, selfId, targetId )
	x805009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳ���¼��Ƿ����ͨ���� NPC ִ��
--**********************************
function x805009_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805009_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805009_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805009_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- �����������¼��б��е��¼�
	if x805009_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	-- �����ű��Դ��¼�������д�ģ�δ���޸�
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 4)
	elseif GetNumText() == 6 then
		CitySetLevel(sceneId, selfId, sceneId, 0)
	elseif GetNumText() == 7 then
		CitySetLevel(sceneId, selfId, sceneId, 1)
	elseif GetNumText() == 8 then
		CitySetLevel(sceneId, selfId, sceneId, 2)
	elseif GetNumText() == 9 then
		CitySetLevel(sceneId, selfId, sceneId, 3)
	elseif GetNumText() == 10 then
		CitySetLevel(sceneId, selfId, sceneId, 4)
	elseif GetNumText() == 11 then
		-- �������������̣��Ͳ������ʹ���������
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,144,98)

	elseif GetNumText() == 12 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó�����������
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 100)
	elseif GetNumText() == 13 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó��з�չ���ƽ���
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 101)
	elseif GetNumText() == 14 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó����о�����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 102)
	elseif GetNumText() == 15 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ð��������
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
	elseif GetNumText() == 18 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó�����ҵ·�߽���
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 16 then
		--��ù�Ʊ���رգ��Ƶ�����npc��

		--�Ƿ��Ǳ����Ա
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "���²��Ǳ����Ա���������񲻱���档"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�Ƿ������˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN)) then
				BeginEvent(sceneId)
					strText = "�Բ���,ֻ����ҵ��Ա���ǰ������ܹ���ù�Ʊ."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�����Ƿ�
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "��λС�ֵ����ھ������̣�δ������һЩ�����絽40���������ң����ǵ���"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local curMoney = 0
		local maxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
		elseif level>=55 and level<69 then
			curMoney = 30000
			maxMoney = 150000
		elseif level>=70 and level<84 then
			curMoney = 40000
			maxMoney = 250000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
		end

		--�Ƿ�����Ʊ
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "�Բ���,��ֻ����ȡһ�Ź�Ʊ"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--�����ʽ��Ƿ񹻿���һ����Ʊ��
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "�����ʽ𲻹�Ϊ�㿪����Ʊ"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805009_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
					--�������ڳ���,��Ʒ���ͻ��Ӧ�õ���Ʒ��ֵ
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					BeginEvent(sceneId)
						strText = "�������ã�������Ʊ������ȥ����Ϊ����׬��Щ�ʽ𣬹��Ͳ�С����"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "��������,�޷���������"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end

	elseif GetNumText() == 17 then
		--������Ʊ���رգ��Ƶ�����npc��

		--�Ƿ��Ǳ����Ա
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "���²��Ǳ����Ա..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�Ƿ������˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) ) then
				BeginEvent(sceneId)
					strText = "�Բ���,ֻ����ҵ��Ա���ǰ������ܹ�������Ʊ."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�����Ƿ�
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "��λС�ֵ����ھ������̣�δ������һЩ..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "�����Ʊû��׬��Ӧ׬�ļ�ֵ����ȥ׬׬�ɡ�"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, 50)
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney*0.9)
				AddMoney(sceneId, selfId, TicketMoney*0.1)
				AddExp(sceneId, selfId, 20000)
				local ReturnType = DelItem(sceneId, selfId, x805009_g_TicketItemIdx, 1)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "�޷�ɾ����Ʊ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "�ɹ�ɾ����Ʊ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end

			else
				BeginEvent(sceneId)
					strText = "�Բ���,������Ʊ��ûǮ"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "�Բ���,��û����Ʊ"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 19 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_XianYa}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Build}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 21 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Research}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 22 then
		local guildpos = GetGuildPos( sceneId, selfId )
		if guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN and guildpos ~= GUILD_POSITION_CHIEFTAIN then
			--������ǰ����򸱰�����򿪲鿴���Խ���....
			
			--׼���򿪲鿴���Խ���....(�ȴ�LeaveWord����....)
			--UI�ű�����ֱ�Ӵ򿪽��������World����������(���±��ذ������)....
			--���ͻ��˵�LeaveWord�����º�ᷢ��UI��Ϣ....����ʱ�鿴���Խ���Ż��....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19841120 )
			return
		else
			--����ǰ����򸱰�������������Խ���....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19840424 )
			return
		end
		
	elseif GetNumText() == 23 then
		GuildPromoteToChief(sceneId, selfId)
		
	--���ﹱ�һ��ɰﹱ��
	elseif GetNumText() == 24 then
	
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19821 )

	--���ڶһ��ﹱ��
	elseif GetNumText() == 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGCH_8829_05}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	
	--���������Ϊ����
	elseif GetNumText() == 26 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SQBZ_090205_02}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

 --�ص�����
	elseif GetNumText() == 27 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,181,120)
		
	--�ص�����
	elseif GetNumText() == 28 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,224,185)
	elseif GetNumText() == 29 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{BHCS_090226_11}" )
		AddNumText( sceneId, x805009_g_scriptId, "�ص�����", 9, 11 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			
	--��ṱ�׶ȳƺ�
	elseif GetNumText() == 30 then
		
		local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
		local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
		local guildName = LuaFnGetGuildName(sceneId, selfId);
		
		for i, titleItem in x805009_g_GuildContriTitle do
			if currGuildContriTitle == "" then
				currGuildContriTitle = guildName
			end
			if currGuildContriTitle == guildName..titleItem.currName then	
				local playerName = GetName(sceneId, selfId);

				if currGuildContriSum < titleItem.needContri then
					local strTip = "#R"..playerName.."#W������Ϊ����#G"..guildName..titleItem.name.."#W��ҪΪ�������#G"..titleItem.needContri.."#W�㹱�׵ģ���Ҫ�����Ļ�����Ϊ������һЩ����ɣ�";
					BeginEvent( sceneId )
						AddText( sceneId, strTip )
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
				
				AwardGuildContriTitle( sceneId, selfId, guildName..titleItem.name);
				SetCurTitle( sceneId, selfId, 38, 0 );
				LuaFnDispatchAllTitle( sceneId, selfId )
				
				local strTip = "��ϲ�㣡#R"..playerName.."#W�������������ǰ���#G"..guildName..titleItem.name.."#W�ˣ�Ϊ�˰���ʢ����ҵ������Ŭ���ɣ�"
				
				--������Ч
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
				local sMessage = format("@*;SrvMsg;GLD:#W�������#R#{_INFOUSR%s}#WΪ�������´󹦣������λ��#G%s#W����#R#{_INFOUSR%s}#W�ٽ�������Ϊ���������¹���", playerName, guildName..titleItem.name ,playerName);	
	    		BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			
				sMessage = format("#W#{_INFOUSR%s}Ϊ#G%s#W�Ľ��費�����࣬�ش����λ��#G%s#W��", playerName,guildName, guildName..titleItem.name );
				BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
		
				BeginEvent( sceneId )
					AddText( sceneId, strTip )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				
				break;
			end
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x805009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805009_NotifyFailTips( sceneId, selfId, "�����ڲ�����ȡ�������" )
		elseif ret == -2 then
			x805009_NotifyFailTips( sceneId, selfId, "�޷����ܸ�������" )
		end

		return
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x805009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805009_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x805009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ�����������
--**********************************
function x805009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805009_OnDie( sceneId, selfId, killerId )
end

function x805009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ﹱ����UI 19821 Banggong Exchange���õ�����
--**********************************
function x805009_BanggongExchange( sceneId, selfId, nvalue ) --������������ֵ��ʵ�ʵĿ۳�ֵ��Ҫ�ڴ˻�����+10%��˰��
	local haveBangGong = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)
	
	--�Ƿ�ȫʱ�䣬����жϺ��������Լ�����ʾ��Ϣ������Ҫ����д��ʾ��Ϣ
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	--�����Ƿ񳬹���������
	if nvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_03}")
		return
	end
	
	--�ﹱ�Ƶ�����Ȳ��ܳ���200��
	if nvalue > 200 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_25}")
		return
	end
	
	--�ﹱ�Ƶ���С��Ȳ��ܵ���10��
	if nvalue < 10 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_26}")
		return
	end
	
	local totalvalue = floor( nvalue*0.1 ) + nvalue

	--����˰��֮���Ƿ����㹻�ﹱ
	if totalvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_27}")
		return
	end
	
	--�������Ƿ��пռ�
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) <= 0 then
		x805009_NotifyFailTips( sceneId, selfId, "#{SJQM_8819_20}")
		return
	end
	
	local ret = CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, -totalvalue)
	if ret == 1 then
		local BagIndex = TryRecieveItem( sceneId, selfId, 30900050, QUALITY_MUST_BE_CHANGE )
		local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
		
		if BagIndex ~= -1 then
			SetBagItemParam(sceneId, selfId, BagIndex, 4, 2, roleBangPaiID) --����ID
			SetBagItemParam(sceneId, selfId, BagIndex, 8, 2, nvalue) --�ﹱ��ֵ
			LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
			x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_10}"..nvalue.."#{BGCH_8829_11}")
		else
			x805009_NotifyFailTips( sceneId, selfId, "������Ʒ����")
		end
	else
		x805009_NotifyFailTips( sceneId, selfId, "�۳��ﹱʧ��")
	end
	
end
