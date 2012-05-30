-- ������ �ɼ�[�ɿ��ҩ]

-- �ű���
x710531_g_ScriptId = 710531

-- ��������Ϣ
x710531_g_GPInfo = {}

-- �������
x710531_g_RandNum = 10000

-- abilityId: �������Ӧ���� name: �����������
-- mainId: ��Ҫ������ mExtraCountOdds: ��Ҫ�����������������ļ���
-- associatedId: ����Ʒ�б�aOdds ���ʳ���ʱ�����һ�����б����Ϊ�� aOdds: ����Ʒ������ aExtraCountOdds: ���ָ���Ʒ�������������
-- rareId: ϡ����Ʒ��ϡ����Ʒ����û�У��� -1�� rOdds: ϡ����Ʒ������
-- needLevel: �ɼ�����������Ҫ�ļ���

-- ���²���Ϊ��ҩ

x710531_g_GPInfo[776] = { abilityId = ABILITY_CAIYAO, name = "����ǧ���", mainId = 40004414 }

-- ���ϲ���Ϊ��ҩ

-- ��������
function x710531_OnCreate( sceneId, growPointType, x, y )
	
	
	-------------------------------------------------------------------	
	--��Ƿ�ʼ
	local actId = 36;	
	local bActStatus = GetActivityParam( sceneId, actId, 0 );
	
	if bActStatus <= 0 then
		return -1;
	end
	
	--��ҩ�Ƿ��Ѿ�����
	local bQianNianCaoGen = GetActivityParam( sceneId, actId, 1 );

	if bQianNianCaoGen > 0 then
		return -1;
	end
	-------------------------------------------------------------------

	
--	PrintStr("growPointType".."x:"..x.."y:"..y);

	-- ÿ�������������ܵõ�һ����Ʒ������ֱ�ӷ��� itembox ��һ��
	local ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, 40004414 )	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,30*60*1000)	--�趨����ʱ��
	
	SetActivityParam( sceneId, actId, 1, 1 );
	
--	local message = format("@*;SrvMsg;SCA:#{JingHu_LingYao_00}" );	
--	AddGlobalCountNews( sceneId, message )

end

-- ���������ʱ
function x710531_OnOpen( sceneId, selfId, targetId )



	return OR_OK
end

-- ������������
function x710531_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	-- ���ľ���
--	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	return OR_OK
end

-- ���Ӽ����ˣ�����
function x710531_OnRecycle( sceneId, selfId, targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	--ͳ������
	LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "�ɼ��ɲ�");

--	LuaFnAuditAbility(sceneId, selfId, GPInfo.abilityId, -1, -1)
	-- ����������
--	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	--����1�����������
	return 1
end

function x710531_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x710531_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
