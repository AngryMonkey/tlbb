-- 212220
-- �һ���Ʒ
x212220_g_scriptId = 212220

x212220_g_Stone = {	{level=50,id=20310000,num=15},
										{level=60,id=20310000,num=30},
										{level=70,id=20310000,num=60},}
										
x212220_g_Stone2 = {	{level=50,id=20310003,num=15},
										{level=60,id=20310003,num=30},
										{level=70,id=20310003,num=60},}


x212220_g_Item = {
	{level=50,id=10410001},{level=50,id=10422013},{level=50,id=10420004},{level=50,id=10423021},
	{level=60,id=10410002},{level=60,id=10422014},{level=60,id=10420005},{level=60,id=10423022},
	{level=70,id=10410003},{level=70,id=10422015},{level=70,id=10420006},{level=70,id=10423023},
}

x212220_g_BossItem = {
	{item=10401002,boss="#{_BOSS33}",scene=0},
	{item=10403002,boss="#{_BOSS33}",scene=0},
	{item=10405001,boss="#{_BOSS33}",scene=0},
	{item=10404002,boss="#{_BOSS33}",scene=0},
				
	{item=10401003,boss="#{_BOSS37}",scene=0},
	{item=10403003,boss="#{_BOSS37}",scene=0},
	{item=10405002,boss="#{_BOSS37}",scene=0},
	{item=10404003,boss="#{_BOSS37}",scene=0},
	
	{item=10401004,boss="#{_BOSS41}",scene=0},
	{item=10403004,boss="#{_BOSS41}",scene=0},
	{item=10405003,boss="#{_BOSS41}",scene=0},
	{item=10404004,boss="#{_BOSS41}",scene=0},
}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212220_OnDefaultEvent( sceneId, selfId, targetId )

	local nNum = GetNumText()
	if nNum == 50 or nNum == 60 or nNum == 70   then
		
		local str
		
		if nNum == 50  then
			str = "�������ý�15�������񽻸��ҾͿ��Դ�����װ������ѡһ����"
		elseif nNum == 60  then
			str = "�������ý�30�������񽻸��ҾͿ��Դ�����װ������ѡһ����"
		elseif nNum == 70  then
			str = "�������ý�60�������񽻸��ҾͿ��Դ�����װ������ѡһ����"
	
		end
		BeginEvent(sceneId)
			AddText(sceneId,str);
			for i, temp in x212220_g_Item do
				if temp.level == nNum  then
					AddRadioItemBonus( sceneId, temp.id, 1 )
				end
			end
		EndEvent( )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x212220_g_scriptId,0)
	end
	

end

--**********************************
--�о��¼�
--**********************************
function x212220_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x212220_g_scriptId, "�һ�50����װ", 6, 50 )
	AddNumText( sceneId, x212220_g_scriptId, "�һ�60����װ", 6, 60 )
	AddNumText( sceneId, x212220_g_scriptId, "�һ�70����װ", 6, 70 )
	
end

--**********************************
--����������
--**********************************
function x212220_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x212220_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x212220_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x212220_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212220_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x212220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- ��⴫���������ֵ�ǲ�����Ч��
	local logNum1 = 0
	local logNum2 = 0
	local item
	local stone
	local stone2
	local bHaveItem = 0
	local bHaveStone = 0
	local temp
	local temp1
	for i, temp in x212220_g_Item do
		if temp.id == selectRadioId  then
			item = temp
			bHaveItem = 1
		end
	end
	
	-- �ύ����Ʒ����Ӧ��ֱ�ӷ��أ���������
	if bHaveItem == 0  then
		return
	end
	
	for i, temp1 in x212220_g_Stone do
		if temp1.level == item.level   then
			stone = temp1
			bHaveStone = 1
		end
	end
	
	--�����û�еڶ���ʯͷ
	for i, temp1 in x212220_g_Stone2 do
		if temp1.level == item.level   then
			stone2 = temp1
			bHaveStone = 1
		end
	end
	
	-- �Ҳ�����Ӧ��ʯͷ��ֱ�ӷ���
	if bHaveStone == 0    then
		return
	end
	
	-- 1�������������ǲ�����λ���ܹ�������Ʒ
	BeginAddItem(sceneId)
		AddItem( sceneId, item.id, 1 )
	local ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		BeginEvent(sceneId)
			strText = "��������,�޷��һ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 2������ʯͷ����
	local selfStoneCount = GetItemCount(sceneId,selfId, stone.id) + GetItemCount(sceneId,selfId, stone2.id)
	if stone.num > selfStoneCount   then
		BeginEvent(sceneId)
			strText = "��û���㹻�Ĳ�������ȡ�����Ʒ��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 3����ⱳ���У������ʯͷ�������Ͳ���ִ����ȥ
	if LuaFnGetAvailableItemCount( sceneId, selfId, stone.id ) + LuaFnGetAvailableItemCount( sceneId, selfId, stone2.id ) < stone.num  then
		BeginEvent(sceneId)
			strText = "����ʧ�ܣ��������ύ����Ʒ�ǲ��������ˡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 4��ɾ����Ʒ ��ɾ���󶨵�
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, stone.id );
	if(BangdingNum >= stone.num) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, stone.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "ɾ��ʧ�ܣ��������ύ����Ʒ�ǲ��������ˡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = stone.num;
	elseif(BangdingNum == 0) then
		
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, stone2.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "ɾ��ʧ�ܣ��������ύ����Ʒ�ǲ��������ˡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = stone2.num;	
	
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, BangdingNum)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "ɾ��ʧ�ܣ��������ύ����Ʒ�ǲ��������ˡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = BangdingNum;
		
		--ɾû�󶨵�
		local Delete = stone.num - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, Delete)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "ɾ��ʧ�ܣ��������ύ����Ʒ�ǲ��������ˡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = Delete;
	end
	
	-- ������
	AddItemListToHuman(sceneId,selfId)

	-- ��¼Log
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone.id, logNum1, item.id)
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone2.id, logNum2, item.id)
	
	--�һ��ɹ���������Ч
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	-- �����繫��
	local szItem = GetItemTransfer(sceneId,selfId,0)
	local randMessage = random(3);

	if randMessage == 1 then
   	message = format("#Y�µ�#P�ѱ��Ӵյ�#W#{_INFOUSR%s}#P������#Y������#P������һ������Ƭ�̺��ͷ����һ���������#{_INFOMSG%s}#P�����ˡ�", 
   										GetName(sceneId, selfId), szItem);

	elseif randMessage == 2 then		
		message = format("#Y�µ�#P��#W#{_INFOUSR%s}#P������#Y������#P���˿������ڶ����������ͷ�������Ȳ������#{_INFOMSG%s}#P�����ˡ�", 
											GetName(sceneId, selfId), szItem);
	else
		message = format("#Y�µ�#P����#W#{_INFOUSR%s}#P������#Y������#P������������ϸ����Ƭ�̣���ͷ��������ģ����#{_INFOMSG%s}#P�����ˡ�", 
											GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
	
end

--**********************************
--ɱ����������
--**********************************
function x212220_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x212220_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212220_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--ɱ��BOSSʰȡװ�������繫��
--**********************************
function x212220_ItemBulletin( sceneId, selfId, itemId, bagidx, bGem )
	local bHaveItem = 0
	local bossitem
	for i, temp in x212220_g_BossItem do
		if temp.item == itemId  then
			bossitem = temp
			bHaveItem = 1
		end
	end
	
	if bHaveItem == 0  then
		return
	end
	
	if sceneId ~= 167 then --by hukai 2008.10.06 BugID38192
		return
	end
	
	local szItem = GetBagItemTransfer(sceneId, selfId, bagidx)
	
	local randMessage = random(3);
	
	randMessage =3
	
	
	if randMessage == 1 then
   	message = format("#{_INFOUSR%s}#P��#G%s#P��һ�ǡ����Ľš�����#Y%s#P�Ȳ������ȫʤ���õ���һ��#{_INFOMSG%s}��", 
   										GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, szItem );

	elseif randMessage == 2 then		
		message = format("#{_INFOUSR%s}#P��#G%s#Pһ�С������񽣡�����#Y%s#P��ʰ��#Y%s#P���µ�#{_INFOMSG%s}#P��Ц��ȥ��", 
											GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, bossitem.boss, szItem);
	else
		message = format("#Y%s#P��#G%s#P��#W#{_INFOUSR%s}#P�����һ����ȭ���ˣ�ֻ�ý���һ��#{_INFOMSG%s}#P���ġ�", 
											bossitem.boss, GetSceneName(sceneId), GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
end

