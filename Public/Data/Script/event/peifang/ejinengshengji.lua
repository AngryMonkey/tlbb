--�������ܵĽű�

--�ű���
x713500_g_ScriptId = 713500

x713500_g_AbilityName = {}
x713500_g_AbilityDescription = {}
x713500_g_StudyCost = {}

x713500_g_AbilityName[1] = "���"
x713500_g_AbilityName[2] = "��ҽ"
x713500_g_AbilityName[3] = "�ӹ�"
x713500_g_AbilityName[8] = "�ɿ�"
x713500_g_AbilityName[9] = "��ҩ"
x713500_g_AbilityName[10] = "����"
x713500_g_AbilityName[11] = "��ֲ"
x713500_g_AbilityDescription[1] = "    �������Ķ��������Գ�~~~"
x713500_g_AbilityDescription[2] = "��ҽ�ɲ���һ��һϦ�ܹ�ѧ���..."
x713500_g_AbilityDescription[3] = "����װ�����ϳɱ�ʯ��Ҫ�ļ���"
x713500_g_AbilityDescription[8] = "�ɿ���Ȼ���࣬ȴ��һ��׬Ǯ�����հ�"
x713500_g_AbilityDescription[9] = "�ҿ��Խ��������ҩ�ı��죬���÷�ʱ����ѧʲô��ҽ��һ������׬Ǯ"
x713500_g_AbilityDescription[10] = "û�����ĵ����ǲ��ܵ��������"
x713500_g_AbilityDescription[11] = "��һ�����ֵ�ũ����"


--����ʱ������ʹ��ͬ���Ļ��Ѷ��壬��ʽ������ʱ�������Ҫ���Բ��ö�ά���飬���磺
--x713500_g_StudyCost[1][1] = 200
x713500_g_StudyCost[1] = 0
x713500_g_StudyCost[2] = 0
x713500_g_StudyCost[3] = 0
x713500_g_StudyCost[8] = 0
x713500_g_StudyCost[9] = 0
x713500_g_StudyCost[10] = 0
x713500_g_StudyCost[11] = 100
--**********************************
--������ں���
--**********************************
function x713500_OnDefaultEvent( sceneId, selfId, targetId, AbilityID )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)

	BeginEvent(sceneId)
		AddText(sceneId, "�������ƣ�" .. x713500_g_AbilityName[AbilityID])
		AddText(sceneId, x713500_g_AbilityDescription[AbilityID])

		if AbilityLevel < 1 then
			AddText(sceneId, "ѧϰ�������Ҫ����һ��������")
		else
			AddText(sceneId, "��ǰ���ܵȼ���" .. AbilityLevel .. " ��")
			AddText(sceneId, "�����������Ҫ����һ��������")
		end
	EndEvent(sceneId)

	--�����Ȳ���
	if ExpPoint < (AbilityLevel + 1) * 10 then
		BeginEvent(sceneId)
			strText = format("��������Ȳ���")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif GetMoney(sceneId, selfId) < x713500_g_StudyCost[AbilityID] then
		BeginEvent(sceneId)
			strText = format("���Ǯ������")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		DispatchMissionInfo( sceneId, selfId, targetId, x713500_g_ScriptId, AbilityID )
	end

   	return 1
end

--**********************************
--�о��¼�   2006-01-06 ����
--**********************************
function x713500_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713500_g_ScriptId,"��Ҫѧϰ����",12,-1);
end

--**********************************
--����������
--**********************************
function x713500_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x713500_OnAccept( sceneId, selfId, AbilityID )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, AbilityID )
	SetHumanAbilityLevel( sceneId, selfId, AbilityID, AbilityLevel + 1 )
end
