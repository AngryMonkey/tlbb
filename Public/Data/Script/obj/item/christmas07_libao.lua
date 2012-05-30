--07ʥ��Ԫ���
--ʥ����ҹ�
--���ʹ�ýű�


--�ű���
x300065_g_scriptId = 300065

--��Ʒ���ʱ�....
x300065_g_GiftTbl = {

	{ itemId=10124134, odds=10   },
	{ itemId=10141090, odds=10   },

	{ itemId=30509039, odds=20000},
	{ itemId=30505146, odds=10000},

	{ itemId=10141100, odds=4990 },
	{ itemId=10141101, odds=4990 },

	{ itemId=30501125, odds=15000},
	{ itemId=30501126, odds=15000},
	{ itemId=30501127, odds=15000},

	{ itemId=-999,     odds=15000},

}

--ʥ��ñ��....
x300065_g_HatTbl = {

	10410098,
	10410099,
	10410100,
	10410101,
	10410102,
	10410103,
	10410104,
	10410105,
	10410106,
	10410107

}

--��Ч��....
x300065_g_ImpactTbl = {

	[30505150] = 10483,
	[30505153] = 10484,
	[30505152] = 10485,
	[30505151] = 10486

}

--**********************************
--�¼��������
--**********************************
function x300065_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300065_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300065_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300065_OnConditionCheck( sceneId, selfId )
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300065_OnDeplete( sceneId, selfId )

	local bagpos = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local itemId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, bagpos)
	local impactId = x300065_g_ImpactTbl[itemId]

	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		if impactId then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactId, 0)
		end
		return 1;
	end

	return 0;

end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300065_OnActivateOnce( sceneId, selfId )

	--������....( 0.1*x*x + 6*x + 20 ) *15 *5....
	--7.5*x*x + 450*x +1500
	local Level = GetLevel(sceneId,selfId)
	local exp = 7.5 * Level * Level + 450 * Level +1500
	LuaFnAddExp( sceneId, selfId, floor(exp))

	--����Ʒ....
	local GiftId = 0
	local randValue = random(100000);
	randValue = randValue - 1;

	for _, item in x300065_g_GiftTbl do
		if item.odds >= randValue then
			GiftId = item.itemId
			break;
		end
		randValue = randValue - item.odds;
	end

	if GiftId == 0 then
		return 1
	end

	--���������ʥ��ñ....������Ӧ�ȼ�....ǿ�ư�....
	if GiftId == -999 then

		local hatId = 1

		if Level < 10 then
			hatId = 1
		elseif Level < 100 then
			hatId = floor( Level/10 ) + 1
		else
			hatId = 10
		end

		GiftId = x300065_g_HatTbl[hatId]
		local BagPos = TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )
		if -1 ~= BagPos then
			LuaFnItemBind( sceneId, selfId, BagPos)
		end
		
		--��־ͳ��
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		local log = format("itemId=%d", GiftId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_SNOW, guid, log)

	elseif GiftId == 30509039 or GiftId == 10124134 or GiftId == 10141090 then
	--�̻� ��װ ������Ҫ��....
	
		local BagIndex = TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			LuaFnItemBind( sceneId, selfId, BagIndex)
		end

	else
	--������ֱ�Ӹ�....

		TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )

	end

	--����ϲ�ʼ�....
	if GiftId ~= 0 then
		LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "    ��ϲ�����ʥ������#Y#{_ITEM" ..GiftId.. "}#W��#r    �������˲���ף��ʥ�����֣�Ը���ڡ������˲�������������Զ���ġ���졣 Ը���롶�����˲���һ����׳�ɳ������๲�㣬һͬ�������á�������ǰ����")
	end


	return 1;

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300065_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
