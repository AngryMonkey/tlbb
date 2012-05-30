-- 领取钱宏宇称号

-- 脚本号
x050106_g_scriptId = 050106

-- 称号列表
x050106_g_TitleList = {
	{
		relation = 1000,
		title = "剿匪义士",
		failMsg = "    要获得一级称号，你我之间的关系值至少要达到1000，还是多完成几次剿匪再来找我吧。",
		succMsg = "    阁下武功了得，在下十分的敬佩，江湖传闻阁下为#R剿匪义士#W，我看当之无愧！",
	},
	{
		relation = 2000,
		title = "破匪侠士",
		failMsg = "    要获得二级称号，你我之间的关系值至少要达到2000，还是多完成几次剿匪再来找我吧。",
		succMsg = "    阁下武功了得，在下十分的敬佩，江湖传闻阁下为#R破匪侠士#W，我看当之无愧！",
	},
	{
		relation = 4000,
		title = "镇匪英侠",
		failMsg = "    要获得三级称号，你我之间的关系值至少要达到4000，还是多完成几次剿匪再来找我吧。",
		succMsg = "    阁下武功了得，在下十分的敬佩，江湖传闻阁下为#R镇匪英侠#W，我看当之无愧！",
	},
	{
		relation = 6500,
		title = "天下匪见愁",
		failMsg = "    要获得四级称号，你我之间的关系值至少要达到6500，还是多完成几次剿匪再来找我吧。",
		succMsg = "    阁下武功了得，在下十分的敬佩，江湖传闻阁下为#R天下匪见愁#W，我看当之无愧！",
	},
}

--**********************************
-- 事件交互入口
--**********************************
function x050106_OnDefaultEvent( sceneId, selfId, targetId )
	local opt = GetNumText()
	if opt == 7 then							-- 领取称号
		x050106_GetTitleOptions( sceneId, selfId, targetId )
	elseif opt == 8 then						-- 领取新的称号
		x050106_GetNewTitle( sceneId, selfId, targetId )
	end
end

--**********************************
-- 列举事件
--**********************************
function x050106_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x050106_g_scriptId, "领取称号", 8, 7 )
end

--**********************************
-- 点击领取称号选项
--**********************************
function x050106_GetTitleOptions( sceneId, selfId, targetId )
	local str = format( "    啊，%s，我对完成缉拿剿匪任务的英雄总是很是佩服，现在你我的关系值为%d，当你我的关系值达到1000，2000，4000，6500皆可以在我这里兑换称号。",
		GetName( sceneId, selfId ), GetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU ) )

	BeginEvent( sceneId )
		AddText( sceneId, str )
		AddNumText( sceneId, x050106_g_scriptId, "领取新的称号", 8, 8 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 点击领取新称号选项
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
			str = "    阁下如今已是名冠江湖的天下匪见愁了，江湖上的匪类闻阁下之名人人丧胆，个个惊心啊。已经没有更高的称号可以表达你的能力了。"
		else
			for i = loc, getn( x050106_g_TitleList ) do
				if relation < x050106_g_TitleList[i].relation then
					str = x050106_g_TitleList[i].failMsg
					break
				elseif x050106_g_TitleList[i].title ~= GetQHYTitle( sceneId, selfId ) then		-- 当前称号不是本称号
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
