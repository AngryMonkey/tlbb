-- ��ȡǮ����ƺ�

-- �ű���
x050106_g_scriptId = 050106

-- �ƺ��б�
x050106_g_TitleList = {
	{
		relation = 1000,
		title = "�˷���ʿ",
		failMsg = "    Ҫ���һ���ƺţ�����֮��Ĺ�ϵֵ����Ҫ�ﵽ1000�����Ƕ���ɼ��ν˷��������Ұɡ�",
		succMsg = "    �����书�˵ã�����ʮ�ֵľ��壬�������Ÿ���Ϊ#R�˷���ʿ#W���ҿ���֮������",
	},
	{
		relation = 2000,
		title = "�Ʒ���ʿ",
		failMsg = "    Ҫ��ö����ƺţ�����֮��Ĺ�ϵֵ����Ҫ�ﵽ2000�����Ƕ���ɼ��ν˷��������Ұɡ�",
		succMsg = "    �����书�˵ã�����ʮ�ֵľ��壬�������Ÿ���Ϊ#R�Ʒ���ʿ#W���ҿ���֮������",
	},
	{
		relation = 4000,
		title = "���Ӣ��",
		failMsg = "    Ҫ��������ƺţ�����֮��Ĺ�ϵֵ����Ҫ�ﵽ4000�����Ƕ���ɼ��ν˷��������Ұɡ�",
		succMsg = "    �����书�˵ã�����ʮ�ֵľ��壬�������Ÿ���Ϊ#R���Ӣ��#W���ҿ���֮������",
	},
	{
		relation = 6500,
		title = "���·˼���",
		failMsg = "    Ҫ����ļ��ƺţ�����֮��Ĺ�ϵֵ����Ҫ�ﵽ6500�����Ƕ���ɼ��ν˷��������Ұɡ�",
		succMsg = "    �����书�˵ã�����ʮ�ֵľ��壬�������Ÿ���Ϊ#R���·˼���#W���ҿ���֮������",
	},
}

--**********************************
-- �¼��������
--**********************************
function x050106_OnDefaultEvent( sceneId, selfId, targetId )
	local opt = GetNumText()
	if opt == 7 then							-- ��ȡ�ƺ�
		x050106_GetTitleOptions( sceneId, selfId, targetId )
	elseif opt == 8 then						-- ��ȡ�µĳƺ�
		x050106_GetNewTitle( sceneId, selfId, targetId )
	end
end

--**********************************
-- �о��¼�
--**********************************
function x050106_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x050106_g_scriptId, "��ȡ�ƺ�", 8, 7 )
end

--**********************************
-- �����ȡ�ƺ�ѡ��
--**********************************
function x050106_GetTitleOptions( sceneId, selfId, targetId )
	local str = format( "    ����%s���Ҷ���ɼ��ý˷������Ӣ�����Ǻ���������������ҵĹ�ϵֵΪ%d�������ҵĹ�ϵֵ�ﵽ1000��2000��4000��6500�Կ�����������һ��ƺš�",
		GetName( sceneId, selfId ), GetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU ) )

	BeginEvent( sceneId )
		AddText( sceneId, str )
		AddNumText( sceneId, x050106_g_scriptId, "��ȡ�µĳƺ�", 8, 8 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- �����ȡ�³ƺ�ѡ��
--**********************************
function x050106_GetNewTitle( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local str = ""
		local curTitle = GetQHYTitle( sceneId, selfId )
		local relation = GetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU )
		local loc = 1

		for i = 1, getn( x050106_g_TitleList ) do
			if curTitle == x050106_g_TitleList[i].title then
				loc = i
				break
			end
		end

		if loc == getn( x050106_g_TitleList ) then
			str = "    ��������������ڽ��������·˼����ˣ������ϵķ����Ÿ���֮������ɥ�����������İ����Ѿ�û�и��ߵĳƺſ��Ա����������ˡ�"
		else
			for i = loc, getn( x050106_g_TitleList ) do
				if relation < x050106_g_TitleList[i].relation then
					str = x050106_g_TitleList[i].failMsg
					break
				elseif x050106_g_TitleList[i].title ~= GetQHYTitle( sceneId, selfId ) then		-- ��ǰ�ƺŲ��Ǳ��ƺ�
					SetQHYTitle( sceneId, selfId, x050106_g_TitleList[i].title )
					DispatchAllTitle( sceneId, selfId )
					str = x050106_g_TitleList[i].succMsg
					break
				end
			end
		end

		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
