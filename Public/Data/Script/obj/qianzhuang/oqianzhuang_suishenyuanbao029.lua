--����Ԫ�� NPC
--ע�Ȿ�ű���������Ԫ����ع��ܣ���һ���������е����ӽ����޸ġ�

x181003_g_scriptId 	= 181003
x181003_g_buyrate 	= 0.5

x181003_g_shoptableindex=120
x181003_g_zengdianshop=121

x181003_g_goodact		= 1		--Ԫ���̵�
x181003_g_buyact	 	= 2		--�һ�Ԫ��
x181003_g_ticketact = 3		--�һ�Ԫ��Ʊ
x181003_g_zdianact	= 4		--�����̵�
x181003_g_gotodali	= 5		--��������

x181003_g_normalzdianshop	= 6		--��ͨ�����̵�
x181003_g_lv1zdianshop	= 7			--һ������
x181003_g_lv2zdianshop	= 8			--��������
x181003_g_lv3zdianshop	= 9			--��������
x181003_g_lv4zdianshop	= 10		--�ļ�����
x181003_g_lv5zdianshop	= 11		--�弶����
x181003_g_lv6zdianshop	= 12		--��������
x181003_g_lv7zdianshop	= 13		--�߼�����
x181003_g_lv8zdianshop	= 14		--�˼�����
x181003_g_lv9zdianshop	= 15		--�ż�����
x181003_g_lv10zdianshop	= 16		--ʮ������
x181003_g_newprize	= 17		--�鿴�н�
x181003_g_YuanBaoIntro	= 18	--Ԫ������

x181003_g_leave			= 20	--�뿪
x181003_g_return		= 21	--����(���˵�)
x181003_g_return1		= 22	--����(Ԫ���̵�)
x181003_g_DZYBact		= 23	--����ͼԪ���̵�

--Ԫ���̵�
x181003_g_YBShop		=
{
	--������˳����� 1-N����name = �̵����ƣ�id = �̵�ID��key = GetNumText��˳����� 101-N��
	[1]	= { name = "�����̵�", id = 151, key = 101 },
	[2]	= { name = "�������޹�", id = 152, key = 102 },
	[3]	= { name = "����ʱװ��", id = 120, key = 103 },
	[4]	= { name = "������ڵ�", id = 132, key = 104 },
	[5]	= { name = "���ǰٻ���", id = 133, key = 105 },
	[6]	= { name = "�칬�����", id = 134, key = 106 },
	[7]	= { name = "��ȵ��ҩ��", id = 136, key = 107 },
	[8]	= { name = "#gff00f0�ұ������", id = 137, key = 108 },
	[9]= { name = "���﷢�չ�", id = 145, key = 109 },
	[10]	= { name = "ƮƮ���޹�", id = 135, key = 110 },
	[11]	= { name = "���������", id = 144, key = 111 },
	[12]	= { name = "��ʩˮ��", id = 146, key = 112 },
	[13]	= { name = "����ʯի", id = 149, key = 113 },
	[14]	= { name = "���ݱ�ʯի", id = 150, key = 114 },
	[15]	= { name = "������ʯի", id = 178, key = 115 },
}

--����ͼ�̵�
x181003_g_DZYBShop	=
{
	--������˳����� 1-N����name = �̵����ƣ�id = �̵�ID��key = GetNumText��˳����� 201-N��
	[1]	= { name = "�󵶺ͳ�ǹ����ͼ", id = 156, key = 201 },
	[2]	= { name = "���̺�˫�̴���ͼ", id = 157, key = 202 },
	[3]	= { name = "�Ⱥͻ�����ͼ", id = 158, key = 203 },
	[4]	= { name = "ñ�Ӻ��·�����ͼ", id = 159, key = 204 },
	[5]	= { name = "���׺�Ь�Ӵ���ͼ", id = 160, key = 205 },
	[6]	= { name = "����ͻ������ͼ", id = 161, key = 206 },
	[7]	= { name = "��������ͼ", id = 162, key = 207 },
	[8]= { name = "��������ͼ", id = 163, key = 208 },
	[9]	= { name = "��ָ����ͼ", id = 164, key = 209 },
	[10]	= { name = "��������ͼ", id = 165, key = 210 },
}

--**********************************
--�¼��������
--**********************************
function x181003_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181003_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
			local strText = "    ��Ǯ��ʹ����ĥ����Ȼ��������������Ϊ�ϣ���������Ԫ�����ܻ�ʹԭ���ܶ�Ƚ��Ѱ�������ü�������������Щʲô�أ�"
			AddText( sceneId, strText )

			--AddNumText( sceneId, x181003_g_scriptId, "����齱", 2, x181003_g_newprize)
			AddNumText( sceneId, x181003_g_scriptId, "���빺����Ʒ", 2, x181003_g_goodact)
			if targetId >= 0 then
				AddNumText( sceneId, x181003_g_scriptId, "����һ�Ԫ��", 2, x181003_g_buyact)
				AddNumText( sceneId, x181003_g_scriptId, "����һ�Ԫ��Ʊ", 2, x181003_g_ticketact)
			else
				targetId = -1	--Ϊ������������ѡ��
			end
--			AddNumText( sceneId, x181003_g_scriptId, "�����̵�", 2, x181003_g_zdianact)
			if targetId >= 0 then
				--AddNumText( sceneId, x181003_g_scriptId, "��������", 2, x181003_g_gotodali)
			end
			AddNumText( sceneId, x181003_g_scriptId, "Ԫ���������̵����", 11, x181003_g_YuanBaoIntro)
			--AddNumText( sceneId, x181003_g_scriptId, "�뿪����", -1, x181003_g_leave)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x181003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181003_g_buyact then
		--��ѯ���Լ���ʣ�����
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181003_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )
	elseif GetNumText() == x181003_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	elseif GetNumText() == x181003_g_return then
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2�ǲ˵���-1����Ӧ
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_goodact or GetNumText() == x181003_g_return1 then
		BeginEvent( sceneId )
			--local strText = "  ���������ѡ��ͬ��Ԫ���̵꣺"
			--AddText( sceneId, strText )
			AddNumText(sceneId,x181003_g_scriptId, "����ͼר��", 7, x181003_g_DZYBact)
			for i = 1, getn( x181003_g_YBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
			end
			AddNumText( sceneId, x181003_g_scriptId, "������һҳ", -1, x181003_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
--	x181003_NewDispatchShopItem( sceneId, selfId,targetId, x181003_g_shoptableindex )
	elseif GetNumText() == x181003_g_DZYBact then
		BeginEvent( sceneId )
			local strText = "  ���������ѡ��ͬ�Ĵ���ͼ�̵꣺"
			AddText( sceneId, strText )
			
			for i = 1, getn( x181003_g_DZYBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_DZYBShop[i].name, 7, x181003_g_DZYBShop[i].key )
			end
			AddNumText( sceneId, x181003_g_scriptId, "������һҳ", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_zdianact then
		BeginEvent( sceneId )
			strText = "  ���������ѡ��ͬ�������̵꣺"
			AddText( sceneId, strText )
			AddNumText( sceneId, x181003_g_scriptId, "��ͨ������Ʒ", 7, x181003_g_normalzdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "һ������ ", 7, x181003_g_lv1zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�������� ", 7, x181003_g_lv2zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�������� ", 7, x181003_g_lv3zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�ļ����� ", 7, x181003_g_lv4zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�弶���� ", 7, x181003_g_lv5zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�������� ", 7, x181003_g_lv6zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�߼����� ", 7, x181003_g_lv7zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�˼����� ", 7, x181003_g_lv8zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "�ż����� ", 7, x181003_g_lv9zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "ʮ������ ", 7, x181003_g_lv10zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "������һҳ", -1, x181003_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--x181003_NewDispatchShopItem( sceneId, selfId,targetId, x181003_g_zengdianshop )
	elseif GetNumText() == x181003_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)
	elseif GetNumText() == x181003_g_ticketact then
		local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2002 )
	elseif GetNumText() == x181003_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == x181003_g_normalzdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181003_g_lv1zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181003_g_lv2zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181003_g_lv3zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181003_g_lv4zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181003_g_lv5zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181003_g_lv6zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181003_g_lv7zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181003_g_lv8zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181003_g_lv9zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181003_g_lv10zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	elseif GetNumText() == x181003_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		--Ԫ���̵�
		for i = 1, getn( x181003_g_YBShop ) do
			if GetNumText() == x181003_g_YBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBShop[i].id )
				break
			end
		end
		--����ͼר��
		for i = 1, getn( x181003_g_DZYBShop ) do
			if GetNumText() == x181003_g_DZYBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_DZYBShop[i].id )
				break
			end
		end
	end
end

--**********************************
--�ͻ��˹���Ԫ���ӿ�
--**********************************
function x181003_BuyYuanbao( sceneId, selfId, nYuanBao )
	--����Ԫ��
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181003_g_buyrate*1000)
		end
	end
end

--**********************************
--�����������̵꣬��Ϊ�����̵��NPC�̵�
--**********************************
function x181003_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
