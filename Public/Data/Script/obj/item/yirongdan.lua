--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x300029_g_scriptId = 300029 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x300029_g_itemList = {}
x300029_g_itemList[30501003] = {impactId=4828}
x300029_g_itemList[30501007] = {impactId=4836}
x300029_g_itemList[30501008] = {impactId=4837}
x300029_g_itemList[30501009] = {impactId=4838}
x300029_g_itemList[30501010] = {impactId=4839}
x300029_g_itemList[30501011] = {impactId=4840}
x300029_g_itemList[30501012] = {impactId=4841}
x300029_g_itemList[30501013] = {impactId=4842}
x300029_g_itemList[30501014] = {impactId=4843}
x300029_g_itemList[30501015] = {impactId=4844}
x300029_g_itemList[30501016] = {impactId=4845}
x300029_g_itemList[30501101] = {impactId=4846}
x300029_g_itemList[30501102] = {impactId=4847}
x300029_g_itemList[30505132] = {impactId=4848}
x300029_g_itemList[30501107] = {impactId=4849}
x300029_g_itemList[30501108] = {impactId=4850}
x300029_g_itemList[30501109] = {impactId=4851}
x300029_g_itemList[30501110] = {impactId=4852}
x300029_g_itemList[30501111] = {impactId=4853}
x300029_g_itemList[30501112] = {impactId=4854}
x300029_g_itemList[30501113] = {impactId=4855}
x300029_g_itemList[30501114] = {impactId=4856}
x300029_g_itemList[30501115] = {impactId=4857}
x300029_g_itemList[30501116] = {impactId=4858}
x300029_g_itemList[30501125] = {impactId=4860}
x300029_g_itemList[30501126] = {impactId=4861}
x300029_g_itemList[30501127] = {impactId=4862}
x300029_g_itemList[30501128] = {impactId=4863}
x300029_g_itemList[30501129] = {impactId=4864}
x300029_g_itemList[30501130] = {impactId=4865}
x300029_g_itemList[30501131] = {impactId=4860}
x300029_g_itemList[30501132] = {impactId=4861}
x300029_g_itemList[30501133] = {impactId=4862}
x300029_g_itemList[30501134] = {impactId=4846}
x300029_g_itemList[30501135] = {impactId=4847}
x300029_g_itemList[30501136] = {impactId=4848}
x300029_g_itemList[30501137] = {impactId=4828}
x300029_g_itemList[30501138] = {impactId=4836}
x300029_g_itemList[30501139] = {impactId=4837}
x300029_g_itemList[30501140] = {impactId=4838}
x300029_g_itemList[30501141] = {impactId=4839}
x300029_g_itemList[30501142] = {impactId=4840}
x300029_g_itemList[30501143] = {impactId=4841}
x300029_g_itemList[30501144] = {impactId=4842}
x300029_g_itemList[30501145] = {impactId=4843}
x300029_g_itemList[30501146] = {impactId=4844}
x300029_g_itemList[30501147] = {impactId=4845}
x300029_g_itemList[30501148] = {impactId=4866}
x300029_g_itemList[30501149] = {impactId=4867}
x300029_g_itemList[30501150] = {impactId=4868}
x300029_g_itemList[30501151] = {impactId=4866}
x300029_g_itemList[30501152] = {impactId=4867}
x300029_g_itemList[30501153] = {impactId=4868}
x300029_g_itemList[30501154] = {impactId=4869}
x300029_g_itemList[30501155] = {impactId=4870}
x300029_g_itemList[30501156] = {impactId=4871}
x300029_g_itemList[30501157] = {impactId=4873}
x300029_g_itemList[30501158] = {impactId=4872}
x300029_g_itemList[30501159] = {impactId=4873}
x300029_g_itemList[30501160] = {impactId=4872}
x300029_g_itemList[30501163] = {impactId=4856}
x300029_g_itemList[30501164] = {impactId=4854}
x300029_g_itemList[30501165] = {impactId=4855}
x300029_g_itemList[30503022] = {impactId=4876} --��б���
x300029_g_itemList[30503023] = {impactId=4877} --õ�廨����
x300029_g_itemList[30503024] = {impactId=4878} --��ү����

--**********************************
--�¼��������
--**********************************
function x300029_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300029_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300029_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300029_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300029_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x300029_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end
	
	if(-1~=itemCur.impactId) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, itemCur.impactId, 0);
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300029_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
-- ��Ŀʧ����ʾ
--**********************************
function x300029_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
