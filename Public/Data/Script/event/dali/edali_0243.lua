-- 210243
-- ����ѩԭ�һ�ʱװ

x210243_g_ScriptId = 210243

x210243_g_ItemId = {
										{mp=0,Item=10124009,mpname="������"},
										{mp=1,Item=10124010,mpname="����"},
										{mp=2,Item=10124011,mpname="ؤ��"},
										{mp=4,Item=10124012,mpname="������"},
										{mp=3,Item=10124013,mpname="�䵱��"},
										{mp=5,Item=10124014,mpname="������"},
										{mp=7,Item=10124015,mpname="��ɽ��"},
										{mp=8,Item=10124016,mpname="��ң��"},
										{mp=6,Item=10124017,mpname="������"},
										{mp=9,Item=0},
}

x210243_g_Stone = {id=30505122, num=20} --�󶨵�
x210243_g_Stone2 = {id=30505135, num=20} --û�󶨵�

--**********************************
--������ں���
--**********************************
function x210243_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y��ȡ���ɸ߼�ʱװ" );
			AddText(sceneId, "  ��һλ���м���������ķ��֣�����ѩԭ�ϵ�һЩ�������Ͽ���Я�������ص�#Y�����ռǱ�#W��������ܰ�������20��#Y�����ռǱ�#W���Ϳ��Եõ��������һ�����ɸ߼�ʱװ��#r    ��ô��������㽻����" );
			AddNumText(sceneId, x210243_g_ScriptId,"�һ�", 8, 3);
			AddNumText(sceneId, x210243_g_ScriptId,"ȡ��", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		-- 0��������ǲ�������ȷ������
		local nMenpai = GetMenPai(sceneId,selfId)
		if nMenpai<0 or nMenpai>8   then
			BeginEvent(sceneId)
				AddText(sceneId, "  �㻹û�м���һ�����ɣ�ֻ�оŴ����ɵĵ��Ӳ��ܶһ����ɸ߼�ʱװ����");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 1�������������ǲ������㹻��ʯͷ
		local HaveAllItem = 1
		if (GetItemCount(sceneId, selfId, x210243_g_Stone.id) + GetItemCount(sceneId, selfId, x210243_g_Stone2.id)) < x210243_g_Stone.num   then
			HaveAllItem = 0
		end
	
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "  ����Ҫ��20�������ռǱ����ܶһ����ɸ߼�ʱװ��" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2�������ҵ�������Ƭ�ǲ��Ƕ��ܹ�ɾ��
		local AllItemCanDelete = 1
		local Stone1_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id)
		local Stone2_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone2.id)

		if Stone1_Num+Stone2_Num < x210243_g_Stone.num   then
			AllItemCanDelete = 0
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    �۳������ϵ���Ʒʧ�ܣ��������Ƿ����Ʒ������������Ʒ���ڽ���״̬��" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--�۳���Ʒǰ�����Ʒ
		local	bagpos = -1
		if Stone1_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone.id)
		elseif Stone1_Num == 0 and Stone2_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone2.id)
		end
		
		local GemItemInfo
		if bagpos ~= -1 then
		  GemItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
		end

		
		-- 3�������������ǲ����пռ�Ž���
		local nItemId = 0
		local nMenpaiName = ""
		for i=1, 10  do
			if nMenpai == x210243_g_ItemId[i].mp  then
				nItemId = x210243_g_ItemId[i].Item
				nMenpaiName = x210243_g_ItemId[i].mpname
			end
		end
		
		if nItemId==0  then
			return
		end

	 	BeginAddItem(sceneId)
			AddItem( sceneId, nItemId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
		--��ʼ�۳���Ʒ
			local DeleteNum = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id);
			if(DeleteNum >= x210243_g_Stone.num) then
			--�۳��󶨵�
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			elseif(DeleteNum == 0) then
			--�۳�û�а󶨵�
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			else
			--�ȿ۳�û�󶨵��ٿ۳��󶨵�
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, DeleteNum) == 0   then
					delret = 0
				end
				
				DeleteNum = x210243_g_Stone.num - DeleteNum;  --��Ҫɾ����
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, DeleteNum) == 0   then
					delret = 0
				end
				
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
				
				-- ��ʾ���
				BeginEvent(sceneId)
					AddText(sceneId, "�������" .. nMenpaiName .. "�ĸ߼�������װһ����" );
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				-- �����繫��
				local str = ""
				local rand = random(3)
				
				if rand == 1  then
					str = format("#PͻȻ�����ذ������˽Բ�֪���룬ԭ����#{_INFOUSR%s}ʹ��#G20��#{_INFOMSG%s}#P��ȡ�����޳�������ɷ���˵�#G %s�߼�����ʱװ#P��", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				elseif rand == 2  then
					str = format("#P��ѽ��#{_INFOUSR%s}ʹ��#G20��#{_INFOMSG%s}#P������#G %s�߼�����ʱװ#P�����Ϻ����Ǿ��˵�ҫ�ۣ�", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				else
					str = format("#P#{_INFOUSR%s}ʹ��#G20��#{_INFOMSG%s}#P������#G %s�߼�����ʱװ#P����ϲ����ϲ���ٹ�ϲ��", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				end
				
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				
				-- �رմ���
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				return
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#{function_help_094}" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--�о��¼�
--**********************************
function x210243_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText(sceneId, x210243_g_ScriptId,"��ȡ���ɸ߼�ʱװ", 6, 1);
	AddNumText(sceneId, x210243_g_ScriptId,"��ȡ�߼�����ʱװ����", 0, 2);

end

--**********************************
--����������
--**********************************
function x210243_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210243_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x210243_OnAbandon( sceneId, selfId )
end


--**********************************
--����Ƿ�����ύ
--**********************************
function x210243_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210243_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--���������¼�
--**********************************
function x210243_OnEnterZone( sceneId, selfId, zoneId )
end

