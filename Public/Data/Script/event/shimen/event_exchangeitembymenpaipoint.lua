--������

--MisDescBegin
--�ű���
x229009_g_scriptId = 229009

--�����ı�����
x229009_g_ExchangeItem = "�һ���Ʒ"
x229009_g_ExchangeTitle = "�һ��ƺ�"
x229009_g_MissionInfo = "Ϊ�˹�����λ���µ��ӽ������ɷ�����Ϊʦ��׼����һЩ��Ʒ��ʹ��#R400#W�����ɹ��׶ȼ��ɶһ���"  --��������
x229009_g_MissionTarget = ""
x229009_g_ContinueInfo = ""			--δ��������npc�Ի�
x229009_g_MissionComplete = ""	--�������npc˵���Ļ�

--MisDescEnd

x229009_g_exchangeitembymenpaipoint_Index = 23

x229009_g_menpainpc_table =  {
	{menpaiid=MP_SHAOLIN,  menpainame="����", name="����",	 title="�����·���",	x=38, z=98},
	{menpaiid=MP_MINGJIAO, menpainame="����", name="������", title="���̽���", 	x=98, z=52},
	{menpaiid=MP_GAIBANG,  menpainame="ؤ��", name="�δ�",	 title="ؤ�ﳤ��", 	x=91, z=63},
	{menpaiid=MP_WUDANG, 	 menpainame="�䵱", name="������", title="�䵱������",	x=73, z=82},
	{menpaiid=MP_EMEI, 		 menpainame="����", name="������", title="����������",	x=96, z=73},
	{menpaiid=MP_DALI, 	   menpainame="����", name="����",	 title="�����·���",	x=96, z=66},
	{menpaiid=MP_XINGSU, 	 menpainame="����", name="������", title="����������",	x=142, z=55},
	{menpaiid=MP_TIANSHAN, menpainame="��ɽ", name="÷��",	 title="��ɽ�ɴ�ʦ��",	x=91, z=44},
	{menpaiid=MP_XIAOYAO,  menpainame="��ң", name="���Ǻ�", title="��ң�ɴ�����",	x=125, z=144},
}           

--��
x229009_g_MaleTitleInfo = {
	{tlvl=1, mpp=0,    slt="������ʿ", mjt="������ʿ", gbt="ؤ����ʿ", wdt="�䵱��ʿ", emt="������ʿ", xxt="������ʿ", tlt="������ʿ", tst="��ɽ��ʿ", xyt="��ң��ʿ"},
	{tlvl=2, mpp=1000, slt="���»���", mjt="�̻���ʿ", gbt="��������", wdt="��ڤ��ʿ", emt="����ʿ", xxt="�����ɾ�", tlt="�ؾ���ʿ", tst="���첿��", xyt="���پ�ʿ"},
	{tlvl=3, mpp=2500, slt="�����޺�", mjt="���̷���", gbt="���䳤��", wdt="��Ϊ����", emt="������ʿ", xxt="�����й�", tlt="��ʥ��ʦ", tst="��ɽ��ӥ", xyt="������ʿ"},
	{tlvl=4, mpp=5000, slt="�ز�����", mjt="������ʹ", gbt="�ư���ͷ", wdt="�䵱����", emt="��������", xxt="����ҽ��", tlt="��������", tst="��Ԫɽ��", xyt="��ң����"},
}
--Ů	
x229009_g_femaleTitleInfo = {	
	{tlvl=1, mpp=0,	   slt="������Ů", mjt="������Ů", gbt="ؤ����Ů", wdt="�䵱��Ů", emt="������Ů", xxt="������Ů", tlt="������Ů", tst="��ɽ��Ů", xyt="��ң��Ů"},
	{tlvl=2, mpp=1000, slt="��������", mjt="�̻���Ů", gbt="��������", wdt="���ƾ�ʿ", emt="���¾�ʿ", xxt="��������", tlt="�ؾ���Ů", tst="��첿��", xyt="ݪ����ʿ"},
	{tlvl=3, mpp=2500, slt="��������", mjt="����ɢ��", gbt="��ȸ����", wdt="�徲ɢ��", emt="�����Ů", xxt="����ҹ��", tlt="��ʥ��Ů", tst="��ɽѩ��", xyt="�R����Ů"},
	{tlvl=4, mpp=5000, slt="��������", mjt="����ʥŮ", gbt="�Ʋ���Ů", wdt="�䵱����", emt="��������", xxt="����ҩ��", tlt="������Ů", tst="��Ԫ����", xyt="��ңʥŮ"},
}

x229009_g_shimentitle_bonusitem = {
	{menpaiid=MP_SHAOLIN,	bonusItem=10113004},
	{menpaiid=MP_MINGJIAO,	bonusItem=10113004},
	{menpaiid=MP_GAIBANG,	bonusItem=10113004},
	{menpaiid=MP_WUDANG,	bonusItem=10113004},
	{menpaiid=MP_EMEI, 		bonusItem=10113004},
	{menpaiid=MP_DALI, 		bonusItem=10113004},
	{menpaiid=MP_XINGSU,	bonusItem=10113004},
	{menpaiid=MP_TIANSHAN,	bonusItem=10113004},
	{menpaiid=MP_XIAOYAO,	bonusItem=10113004},
}

--**********************************
--�¼��������
--**********************************
function x229009_OnDefaultEvent( sceneId, selfId,targetId )
	--PrintStr("OnDefaultEvent...")
	for i, v in x229009_g_menpainpc_table do
		if v.name == GetName(sceneId, targetId) then
			if v.menpaiid == GetMenPai(sceneId, selfId) then
				--PrintNum(GetNumText())
				if 10 <= GetNumText() and GetNumText() <= 14 then
					--�һ��ƺ�
					x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, GetNumText()-10 )
				elseif 7 == GetNumText() then
				x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
				break
				elseif 8 == GetNumText() then
					--��ӳƺ�
					x229009_AddExchangeTitleList( sceneId, selfId,targetId )
					break
				end	
			else
				local str = "�㲻�Ǳ����ɵ��ӣ���ֻΪ�����ɵ��ӷ���"
				BeginEvent(sceneId)
					AddText(sceneId, str)
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
			end	
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x229009_OnEnumerate( sceneId, selfId, targetId )
	--PrintStr("OnEnumerate...")
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeItem, 3, 7);
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeTitle, 3, 8);

end

function x229009_ExchangeItemBymenpaipointFn( sceneId, selfId,targetId, needPoint )
	
	if (needPoint < 0 ) then
		return
	end
	
	local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
	if menpaipoint < 400 then
		local str = "���ʦ�Ź��׶�ĿǰΪ" .. tostring(menpaipoint) .. "��������400�㣬���Ŭ���ɡ�"
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
	else
		local nItemId, strItemName, strItemDesc = GetOneMissionItem(x229009_g_exchangeitembymenpaipoint_Index)
		BeginAddItem(sceneId)
			AddItem(sceneId,nItemId, 1)
		local ret = EndAddItem(sceneId,selfId)
		if ret <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "��ı��������� �޷��һ���")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		else
			AddItemListToHuman(sceneId, selfId)
			SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-400)
			local str = format("�۳�400�����ɹ��׶ȣ��������%s��", strItemName)
			Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )	
			
			str = format("��õ���%s��", strItemName)
			BeginEvent(sceneId)
				AddText(sceneId, str)
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
				
		end
	end	
	
end

function x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229009_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddString(sceneId,"ExchangeItemBymenpaipointFn");
		UICommand_AddString(sceneId,x229009_g_MissionInfo);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

--/////////////////////////////////////////////////////////////////////////////////

function x229009_GetCurShimenTitleLevel(menpai, title )  --, titleinfo)
	local titlelevel = 0
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].slt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].slt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].mjt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].mjt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].gbt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].gbt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].wdt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].wdt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].emt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].emt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_DALI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tlt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tlt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xxt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xxt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tst then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tst then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xyt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xyt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	end
	
	return titlelevel
end

function x229009_GetSelectedTitle(menpai, titleinfo, level)
	if level < 1 or level > 4 then
		return 0, 0, ""
	end
	
	local title = ""
	if menpai == MP_SHAOLIN then
		title = titleinfo[level].slt
	elseif menpai == MP_MINGJIAO then
		title = titleinfo[level].mjt
	elseif menpai == MP_GAIBANG then
		title = titleinfo[level].gbt
	elseif menpai == MP_WUDANG then
		title = titleinfo[level].wdt
	elseif menpai == MP_EMEI then
		title = titleinfo[level].emt
	elseif menpai == MP_DALI then
		title = titleinfo[level].tlt
	elseif menpai == MP_XINGSU then
		title = titleinfo[level].xxt
	elseif menpai == MP_TIANSHAN then
		title = titleinfo[level].tst
	elseif menpai == MP_XIAOYAO then
		title = titleinfo[level].xyt
	end
	
	return titleinfo[level].tlvl, titleinfo[level].mpp, title
end

function x229009_AddExchangeTitleList(sceneId, selfId, targetId)
	--PrintStr("AddExchangeTitleList...")
	--�õ�����
	local level = GetLevel(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	--local shimentitle = GetShimenTitle(sceneId, selfId)
	--��Ů�ж�
	local titleinfo
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end

	local step = 10
	BeginEvent(sceneId)
	
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_DALI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "����Ҫ" .. needpoint .. "��ʦ�Ź��ף�"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	end
	
	EndEvent()
	
	DispatchEventList(sceneId,selfId,targetId)
end

function x229009_GetShimenTitle_BonusItem(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	for i, v in x229009_g_shimentitle_bonusitem do
		if v.menpaiid == menpai then
			return v.bonusItem
		end
	end
	return 0
end

function x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, level )
	--PrintStr("ExchangeTitleBymenpaipoint")
	--SetHumanMenpaiPoint(sceneId, selfId, 1000000)
	local titleinfo
	local menpai = GetMenPai(sceneId, selfId)
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end
	local title = GetShimenTitle(sceneId, selfId)
	--PrintStr("title=" .. title)
	local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, level)
	local curtitlelvl = x229009_GetCurShimenTitleLevel(menpai, title)
	
	--PrintStr("seltitlelvl=" .. seltitlelvl)
	--PrintStr("curtitlelvl=" .. curtitlelvl)
	
	local str
	if seltitlelvl < curtitlelvl then
		str = "���Ѿ�ӵ�и��߼������ɳƺţ�����Ҫ�һ���"
	elseif seltitlelvl == curtitlelvl then
		str = "���Ѿ�ӵ���˴˳ƺţ�����Ҫ�һ���"
	elseif seltitlelvl > curtitlelvl then
		local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
		--PrintStr("menpaipoint=" .. menpaipoint)
		--PrintStr("needpoint=" .. needpoint)
		if needpoint <= menpaipoint then
			if seltitlelvl == 2 then
				BeginAddItem(sceneId)
					AddItem(sceneId, x229009_GetShimenTitle_BonusItem(sceneId, selfId), 1)
				local ret = EndAddItem(sceneId,selfId)
				if ret > 0 then
					AddItemListToHuman(sceneId, selfId)
					str = "��ϲ����#Y" .. seltitle .. "#W�ĳƺţ�ϣ������Ϊ���ŵķ������Ŭ����������һ�ױ��ŵ��·�������Ϊʦ�������ʱ�������һ�������ɡ�"
					SetShimenTitle(sceneId, selfId, seltitle)
					LuaFnDispatchAllTitle(sceneId, selfId)
					SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
				else
					str = "��ı����Ѿ����ˣ�Ϊʦ׼���͵�С������㣬����ñ���֮���������Ұɡ�"
				end	
			else
				str = "��ϲ����#Y" .. seltitle .. "#W�ĳƺţ�ϣ������Ϊ���ŵķ������Ŭ����"
				SetShimenTitle(sceneId, selfId, seltitle)
				LuaFnDispatchAllTitle(sceneId, selfId)
				SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
			end
		else
			str = "������ɹ��׶Ȳ������޷��һ���"			
		end
	end
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent()
	DispatchEventList(sceneId,selfId,targetId)	
end

