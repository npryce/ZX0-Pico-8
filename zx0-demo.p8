pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- zx0 demo
-- @dredds

#include zx0.inc.p8
#include zx0-str-get.inc.p8
#include zx0-mem-get.inc.p8
#include zx0-mem-set.inc.p8

moon =
 "…ア⁴R てちしア²∧ちルゅ⁶゜◝tッ^~\0(て▮hゅ▮🐱|wwん@ニ🐱゛~シロA◜♥~✽ア|█Vスて◜V!|wさんᶠ█Uしゅ_⬅️t~?◝█⁘きア@さゅV█てSア◝\0Gハ◝█SM\0s~Q웃アア⁘れ\0|█▶W\0]Mロ⁙カ█⁵くちU(て\nゅQJち⁴\rコ🐱)ちUしちVˇゅZゅQ\r□ルA🅾️、■◝チり░ᵉ⬇️█ゅ゜~ユ🐱(ち⁵ワ~ワ+🐱…²/■◜y…ツ⁸~◝🐱⁘ョ◝😐=²チまツ░。ツ|レ◝◜ナへナ(ヨ█>◝²³んまシzんケa◜9ま}(○Jササ6■く░⁷り~ルサ◝ナ~ᶠぬュン~゛ゅGソ░¥ヨ◜|█\rトッ●▶w$カ◜}█VˇりSホ~■Uも■◜■iツ<●Fまカ◜o。ぬ▶➡️ゆワ⌂uヲ}ゆノ⁶7ッWノねゆ○キコ~レぬョよ🐱ᶠらツ6N🐱N~■レゆレキハら90_?カ🐱ン◝★~せらCシTシ>ルワら=ゆOGカ◜◝²◜Eヤ²◜Pや。²G~>◜EZfᵇサカ░}|⁶9mf◜=キy🐱▶れおdソᶠ🐱゜く█Vノ🐱_~yテ゜ミu░= ル\\ハへレ²?けクVシる██|☉\rシッ➡️,レ█ifDツzyる゜█V█f²▒サヨ◜O█Uモ😐◜■DコU`"

fish = 
 "²■ᶜ■りア、り■Nレ●、ヒ。ミᶜ¹▮゜レキ◜ロ¹そ🐱アヒ\0➡️▮アり^ゃ◜ア♪~すQ¹らりにQノヲ█░‖カよカみそ/アᵇョᶜひワ◝マヒき?▮‖マロ○「ゆ▮ネわワ▮まンひロヲwスラの◝らネ▥=ゆイ▮ミJ?■ロワエねヲイシのほれこ♪⁶やも█ツ◜タナk▮カフセと。コ、ネ❎●ゅっイ◜³ツ▮゛76\0\0ヒ?~bは‖‖゛フ{ら¹オvゆ{。1つ⬇️チんpnむzチネテ `○IN○しユ◝SQめネE~>フCテセ4ヤセア`しコワせpゅチモQL🅾️ワつ+いニ⁵ア]はスンッ◝Z□よQ◀む웃。Mれ~rア]Fせ‖Y▤ゅ。り•イjっオ+ク7レろ6セふ▮ト「mcラョu◆~ョᵉャユ、\\」ムvチけネツ/。Qヤメᵇけkネ\0の\n□vさヲソ◝チ\\(っョ゜[◜ロかヌ○ろこをQPにヒ。Eい~²gへおとり\0イモ=え◜(Vl]わチ⌂⌂わᶠ∧トチテ○ホ<せカ「Dn⁵h'、。り○t=い\0ᶜ゛しロみ■ナ◝ヨモ◝ん3¹=お~Rn!ノね\0◝nソ,ア6ラ⌂\0わmツエbハチegつテ¹ト}む◝うくコルチウマ○は⁙⁶+りo⁸SwへMまテ⌂○⁵▮▮~セャ0ホ○!よ▮웃ノ9~コエラ¥ネユレnぬムひ\n◜…リnメンカ◜サ◆ぬ○dイvせmら|ャや8モワ‖ᶜN?っシm◝\0ン{=っ◜つケヤ。カ\0「ワUyイ&:ゆ▮ヨクコつウキねか¹ふフ&⁵P▮と|\0>」アチ□◜トソ6Nュオマゅ)▒\0ヨトイ◝◜マ2¹v ヤけc)%▮ッUッ◝!エヘ]⁸◝^Iキ⬇️>ル○ケqャJせわ7タタと◝‖>ッユモゃチ\"}わzキ\0っスヲチ🅾️カわ‖ヤ\\~◝ムつ²ャホネ◜サリスタ⌂ルrつおP⧗ トカッ○ロ☉マ▶らっイCの\0イ⁙まコ▒かQ0#ヤメみ⁵]レ☉ゆFgrワ◜メカツPひアjヘ¹|ョ2mHゅ;\\>6\tりアQれモZ8ょ●なワ¹~く¹{dエ○Nとす▮k+イS」{ワ…れこ6いチ、Uv•ヌョ\0+▤Pロ*えのPPo□ヨ~)cTmクO⌂つるりよ☉]WZ²jUUカ]れ⁘こ▮oチ🐱シ$チzト♥G-ュめ◜ユも⁵¹イ7ゆヤ!◜○ᵇムᵇ@O█ては■j^!u=J⬅️ト▮□>ヘャケ⁵◝テヨレ◜☉▤◝りmワトへV」よQャニ>シク⁶{ツ²キ▒*>かT◜s▒◝*カア\0ry♪‖よへるルん➡️にˇコ➡️◜◆✽ホモャu⁶とあP\t⌂ミ⁵ ッZᵉミ1▒、/っタ_⬇️ふK⁸|ア8るえア⁙なソ\\rキララ_¥+ ²◜O\0◆わ、ふやユクムしヲかュハムヤQチcH[ツれシヤ☉もるs🅾️☉~1トラ♪は1ツゆスOョ<ᶜ@やをメuみ'Nテ○◝ナタムぬ⌂コ⬅️すkカリ\r●リよイ‖tね)せコヲ▒ラキ:ほ5`リ⬅️q|ᵉIyい\r3アカ\tるヌ<◝U?タ{/こlリkそ<へハチひのᶜ゛ムへつ█1n~ウクLエ~もほ⁙⁷Hソチ😐ム…i>ぬアれを\"(🅾️わうねチs⬆️wト◀れNケゆ⁘るゅ0もミ⁵🐱コトk▒█▤0カ3◜ク¹²ヲ、チれツkほ▮6るっ(Q\"カチんゅンゆ+QU]オアカ]イ♥⁸ツタと゛<て`ᶜヤᶜりIlホら、ウツ\tR65;-:|*<\0つわS\\ᶠG³-チ~t❎m⁙Q\0o#わしn@○7。1マらヨᶜえケY^ん✽ソ♪やり}♪c5ツ³ョレ☉ヤk、◝\"わア1◆⁵‖ᵇねね⁙の\rU^メmチ\"スねEレpよ▶、hR}たカりほ1ケミ◝。Fk⬇️Pツタ³オ?ヲ█😐ゃニタチりカ◜{&⬆️ょし░hト\rキFヤˇ⁵ヨRᵇつ!カセミュメ²v○らレ▒リ>tひわlお_Nち¥▮<⬆️⁴)ケGョtcFュキルろめてロG😐ホ○コヤ\tをわKケ⁷コ,M¹チイよ⬅️▥り。;s.I✽◆⁴DT;○iIちかPlᶜ3ク⁷ユヌャ⁵¹5、😐⬇️をわクQャa-んチ(yカヤM⁵=]ャ(6ヘCD🐱イPチョ◀ユv◝めチj□□wレウホ\r¹ᶠツ。6\\やndと\n³⁙\\]ケ\\めうよᶜ<□やヤVeめニUを゛\"ヌわ❎▮\\○~メョきᶠ「'GわUわヘ▶◜フりれ❎⁙‖Uwネ◝Gᵇャしン!を[ᵉ-⁴,ンカョをニょエカコよ|ネチム_=(るレ1Uˇᵉせ⬇️のP0ラIヘな、るuキれkライSホめカお♪ホカツル⬆️?²○○tと゜∧ゅフi\rタ「の➡️。>トレか?ミこ|ふ1よQコハよ゛⁷²キロシQ)▒カクeしらタ¹<fア。りイrえ웃1lチラi)uと。5+ひ¹⁸っヤヲツFえ😐、=\nqS/るqり○♪っ+ち⁙xGYの³1モロ▶ヤサクれミクる]ほ○。#{メ4G<エGか³2ソフ1ユˇ♪~⌂めcアコ5モ⧗░。コ。せやカo▶イミWシWwネつ♥。UQうᵉ◆ュ_タネ{P‖⧗ル\\⁙なW⁵▒フ\\ャ3=り<゜▶4ゃ⬅️ˇUUい#れ<チ•¹コvuい😐ツ♪z37!-z-⁘れ¹⁙ソエp41オむレ3³</わょ゜ス□\nヒょ‖れ]🐱6チ⁵\\わにふUく³Juよ⁵クaセ9はャほカ³▮ラねりこそac「i(5=\\⁙は⁙コ\rか▒SSり_うャを⁙▮\"アてS、ワ◜ キりねクめ^1Sリ;Y‖Bっケにめオつお○0コツ&ロつ▒-\0■k⁴c1ニmの*るQ\rrッmPf<ロ^😐ャせモフ⁵!‖イをぬこ=fUP⁙U-]-ひク◝✽]W\r♥゜クめトふれ゜んU⁵웃⬆️の1lfソクきケの「♥や0めロ³つ\rュ\\ᵇ-kHeねi\rをosᵇ1=イ]2ワbレンふxうッ⬇️Qffを▮Sさモd😐ウトEまQWヤ\\<4こく(ソカわ<Uカ◜ワSんタネり~コつョzえeクャˇD56c⁵▮い\0|ナ^Nᶠツコ15■v⬅️)うコrほ\rテ1■れ{⁵⁵l^ヤむ▮そヒ²_54TU4U\0○ん1⌂ンろタ⁵コ⁵わ<n,zンに/イ0]⁙웃tメふつわフャ○コカクもN\rY@スカミ24|⁵゜6リ`セEあB³ょセUュ‖|●こ■cれチアカつね`イ\\³tワう0らたホV▮●■<V⁙\0|せuょ/◀gョ³iれね[をウ▶チ゜わ⁙らチ5e\\w{レ⁵³Gほᵇゅュ♪⁴oF◝Kっ。\rmこクノy♪ミUEETTPラc-WサOよ-ᵉA¹ᵇ1を\\3[っlみ00ン*も<qヤ&。~カヲ²ョ⁸3ア<⁙³U²⁴⬇️ECTDけ◜efjCスSしネ▮わuり<]kᵇfるねワえQB🐱レI}&ワ~◜∧▮53\\ ⁵⁴ネ◝@ 🐱⬇️E4⬆️▥*vメVリY-く=トw♥⬇️6➡️◜エ7◜もUハた⁶Pマ○、j▮チツ⁴やイOむM⁴◜そTD:🐱(wロウ▥あン\tᶠSわc<❎<ソふむミサUE♪らW:モpCっ¹ャ⬅️⁙<V◆qR@◝`}ヌD⬆️Tg▒fFヲ◝せシ3イ¹Uにᵇ]ˇ⁵ル¥ロe{ュレレクeンᶠ$⁴ヲを⬇️に ▮l◝'⧗@R⁴ち²C웃dむggか○」ケはと⁵G゜e❎4⁙ッよ-○\0◜◝\0ク⁵zサきむチ█⁸P\0イ<めV⁴s🐱v▒◝'▤▥]i4レjヨをメ⁵ワアミ➡️ち¹ト]ャメヨル?ヲ◜せ\0NK57f⁶⁴>▒⁵/gワ█てY⬅️‖わを゜qよへ○ク◜りュク[!=ち[*Rッ>]\0テ○○kアV⁴Bホ\0T⬅️f∧あ~Qサんサ\\ヨむ3▒り◜)○\r'⁵Pオi|むᵇ🅾️ま⁴○みオり¹●l⁶$ウc²み●◜ソ◜ろUほ⁘?\\⧗○り○ハツ¹レ<}✽ヨルへhチサ◜る웃ゅれ2エfャ⁷す▒ebf⬆️Dあたᶠオま8'#3]チ1ク❎ メえりC>'ア5Pᵇッソョ▒、'をclク○⁴9○お⬆️²@}5\tPは⁴³oワ3♥w◝。{♥ Dラゆョう。⁙rエW○8[○⬇️llウᶠ⬇️○ムGリ⬆️ミ◜あmま「¥ネu1、Y😐タハイろ¹ル⬆️O>ョ✽🐱ル◜ルン⧗ふ★す⬇️o{ロDI²⬅️⬇️▥」カ◆もルˇjッRム◀ふうVさ7y\tュタ◜=xSゆむア█⬅️ロvヘ\0Ix▒コ9⁙ラ」✽ンれ=ャrみ9=ア⁵○み}ア²ワ}a#チミンワ、bᶜをw⁵ちdgwワ▤⬆️◝レ◜よコᶜ▶ほ⁶`ふS(タmスzヲ⬇️◜コホリ○■ほ⁵◜キニモ@⬅️ン\0めTt.ャ▥○i▤ンロミIfチあ⁵³ニZらら、ね◜_なク}ミら◝2…れをホ#◜{✽\0Z∧タOᶠT;ユiみlレカVS◀ろ!ね⁘q³ぬゆ,クeャフ🅾️‖2[~😐。チ.♥カTゅャPるアヲリ♪ル_I○た○UマをmV}m]サVサ⁵サツcVホbP1<t=わ。sョレPレすIネわ。、イナう♪イ<ア<=ュほT³み「w◜I@a■▒✽u]f]4◆yᶠせナ]ᶜわwサ=コ]。ミm■]りけ◝アもチyKや57コCx◜¥らを。¹Ueツツ∧+Tf▮█⬇️⬅️5mfm]meU5う\r1。⁙K\0]○へ◝コヒウワ█♪チカふz🐱Qイ\\ツわラ◝⁵Jわれク■ d#ョラえ‖⁴ec⌂ョササVcEUUツ‖e5eツカ⁵US5ツ⁷\\/#.⁷EDヲメセ○へ¹2タソチ~リ1WoSq❎▥]Tmチ⁶ 1]1Kc6もタf▒p⁷{gいコm[lメkdZユレれ{cツクツ□ち=わ,^Bウ7ふY7(EeE/ᶠサへ]²へかV`l◆⌂¹ココラ<◝\0◆サクフWqVユみ=○/<ツコツりりほl_。|TYKのれ1Uリᶠラ-%]ょ□ミッ5イ*タlGV∧▥Uc<=ツ1cなイf➡️ひQ3チ\\]コりコココわQ、{◀Q゜zめ○カツUめヤ⁴むふの🅾️ハe=ふシ=uメと█⁷⁵⧗ょ。elQコ‖リ¹○ヨ♪め、れへj▒タらlコ;エᵇ⁵w³9ソ¹~トf3¹Rあまらu75]cチ⁵o◝1ヤj■。エア1♥ね|+マS>e[ハMᶜQ<、5\\ZZレ\rかzUI]メ◝アリ▥ヨネo◜⬅️:ゃ⁶マり{²ス⁙ンよ 5やりZそム⁙ラネ▥▒⁵ツタ¹wわルW○め\tクすUろ‖モ-•サ)カ]ュ\\sて\teほ、=oすんゆ░•ュョ➡️フめい³ムLo●エQツカ。‖レ%[LKMアイ%‖レᶠメ•け゜。かャᵇ🅾️\\=んレョ🅾️⧗mhョュ{Cvムスwツ■Dねムら_ほV)カ✽シニ)ぬ トコ|こ⁙Qとほ³゜いpッ○⁸/コカ█🅾️V\\スり○むタEゆnc\rqれ3⁶r_ワわりる)'タ‖\\Sソミ○コヤョ/ツよに(カャ|🅾️ワひしウˇマャ1☉チタせqを▶K▮き<え\r¹0lᵇひc◜Cいえ!クfをふ@7りn◝い웃レりejュ]ュし\tゅ➡️ˇカも■コ¥>=ツ=iᵇHイヤ⁵Q♪ロ:セ~sm<aエQほ\n|ャ♥よ⁙ャKョ♪イ]'Kルもタオンbョアᶜ4オ=Zワわeゆ\0SれツQを\r▒~6ノぬlk⁸イの😐l<ショルgwほミシ▒❎オ1p1/➡️<ヨm²SWシ=ヨUとオわんフネひ~。⁷ツかハ\\こK▮。こ2;゛ソᵇ=ョqGキ⧗∧テ◝チオにト1?[⁘▮つ?れ\\Dま⁶aケ=6ョイ▒⬇️MニHめふ6チ、\r|□GO3ょフ⁶>ュᶠ▒かん1ツ]○|◜•xオ¹(Vキイcへらヤセシ0フ%ョねUイをサ■5アお•を3カミれc■アこˇは{eIサんラリ⧗かA>⁸ムオまオ◝3を=らわ/ᵇち▶ほオえチニA:ク\t5カを•fオ:ネ?をソョ■5ᵉ5んラチ❎ᵉト⁙ᵇケ⬇️ヤi²り]。S◆¹をエ<ヤ;Qよス=」と⁵e◀😐セ5\0⧗Uをわ#³2をふeクめすせekと。‖う░{⁙█⁶ヒソマ?5<ク♪5ゃᶠは」こ▒c。ヤ^ᶠ3イ、ワc3Vクsフや□ュカ|🐱マ9³\\フわ~Qg⌂ろ➡️nJ◀ん)カ◝ひpᵉ/◜セヤイ⁙al‖せ゛aチク5ミを\rKはれᶠも○を◝ねjむノ⁙]はわ⬇️U▤xイm⁙\r}[qやよ³?つ¹c=⁶-ゅlス\nチり⁵0+e5\\]ん5◝1'カq◝□リ○タ■0ふ⁸³²ソYaヤ▥カaK@カ○こ⬆️ク]Sト[⁘も³、。cヤカS¥★ᵇᶜりサ5m◝■wハンふモh2ん==▒4o*🐱、?Toチょチイ9とヘ=⬅️⬇️56fワ=]、ツふzS◜ユ⁙WかoらU0❎⁙#ミ3⬇️SMリ+▒イ/☉ョ。kれエ゜ᶠムzょw■やク◝Yフn3lれeQク=V1やへg[H+み⁙{え~1+j⌂。0m⁶エい9ゃ³セれほ❎マせっQムBgハ3Vaをc➡️ンツ▒○😐mサU_[;GルワいmlめS*yわシ\\ロコ▤9S⁙]51Oふ<タいaSMm○ャほ◝クク)/つ▮E5フk゛6ョ‖f/ラ¹はゅUS!\\]oe\0wコカル\nᶠ^ねrウ⧗³=てチ5。⬇️てフわ、やコい}、[ひᶠe3マ~■めSリPN‖せヒカク\0PPれ3ᶠjオk|N1と;6e。+|)。レイょア/Cサよ\nホ¹]ゅほ。{ミ0ふ⬅️ツHfゆ▮□シ1y1ニ=ロ¥😐テ1わˇヨ\\ょカUョ¥ᵇW。sわニ□⁷へわ◜2ユトe▒ᶜ=b+Pe!ャア³▮をク⁙さ0}カシも\ng_なUり♥モ\0Umひクサシ¥クャv]\0タュJつコ⬅️イサヒわ○‖3チヤKaヤ3トめ+ネ¹ぬサoタf➡️m\\p}タリ◜Bmめツ¥]セ1ᶠョッ■y`よ]わチ\n{EᵇカゅK@コUも◀YCO\r⁷゜ - ネめょ◀わ=マᵇけゆ▤w◜◜ヌテル¹ホ⁙@んチSイこM♥^7lケレ\0•H¥?れふcz◝ホQやQリて♥m#T◀⬆️な1♥リツ!。ラ\0{◜\rコふ5NᶜU◀コ\0`³\"=。を5‖め■ちへgクせクSkzョちケイカWよᶜ⁷ワt❎ゅq[クこカとツ■4⁙ふらZカ■2ワオ<ふか³0'サつwサらつwe6fGL\rG:ょい=めヤ\\ Uo~」[クfOモ6しョぬオロユっ◝ヲとカツイ\r70つツ/ふr/ハ?SクO1*ョlス#♪よイ⁙イ⁵Oアふイチムmりイ゜~ぬツ#ケね+OコカKレ⬅️u;ほ⬅️‖つˇQ1Mˇてv%_❎Qにとツ‖=‖▒K$I)h▮06ア\\]\\もチイ_Vt0ク?こ\\われンョᶜ゜¥ᶜク=q4ツひケ{}えmMa{よaク; イnしツ█キE2り◀ユへア⬅️に。\rタ◀pコヨムケ\r[さら゜<カ³ム」リm\\=[せ1ᶜゃソ[すu=Taラ⬆️ヲ◜い#◝^⁙わツS5‖チ⁶ユ•s▶めhGコツとむ■⁙ニツは]マやわ◆-◀L\rFm-c=0ˇョッ3/🅾️いす\0RVクへ‖웃♪]せ\\0。、ョ¹ョ!⁶⁴ナ゜をUらイ■⁘と1と░5mエ<⌂+=<w‖cをs]▒ひフfKち|ふた{エb□ひクん³ヌるフも¹んをふ」ヤ■ヘねにチ■たトよ◝ヤzレヨmりひウつテeケリ•\"をせ、テ◝をュO○:マチイYヨくん>;ケョりシO⁙エCoF>tねウ⬅️シれ6ろほち◀イツり◝シんト-b\rAめ7ツ█\nケテ=Y~ん#_y⁵チ◝M[ゅよ⁴◜ンミヨフ◆イ<イくlm◀uよ²ゆコル゜ネ;ン7lm▤ムせモPめス▒チ5_,$*キわカ}ソ?ヨ█F゛ヌ/13ムム、セbトクカゃ‖レ¹`チ7ᶠモ1•}⬅️いね「ユフK5わ/まᵇ[ムᵇンaL。てオ=}ᶜ^なョ%'u¥゛♪り9ロワ。▮ツょつョャ³は|ニえ∧こcアチ1ツクSや、ふOまりネむ2モ{\0V=²⁸⁘メj⁸ᶠgサU1⁘チ⁙⌂ツ}シクネコeU`"

krazykat = 
 "ˇwAB(gf⬆️ewZ⁵つ\0vt🐱HeUV\0⁵`▶⬇️⁵P⁶⁶ut²\te⁶`V⁵\0UP□にPe▒7ョ🐱Aう\0`⁵ルン█Ha⁵U\0f⁶&Wev▮oVし-░み⁵p█'gUuニンzN⧗タ⁶█と█⁵∧ZluvV▒🐱jg\"⁷u.eVンノP█⌂Wf▒U¥⁶そW(eef⁵●`f'geなヨfネスv░F#W`{~⁶∧ 7uW}\tて¥Vユナツ✽}░す█⁵⁵p¥v⁸もWvャいnUMち7/れナつ⁵wf◜⬇️ク◝゜「fVU⁵e.Vマヒ²%ff*PレUテよ\0●そ█vれw9➡️█◆ufゆ|け○7?M⁸~◜=P⁵▒bᶠWP|ᵉョ⁸キレOユvけツつゃ3ッ○⧗⬅️エzのしfトo◜めe|R<ᶠ\"5タ'6🐱Xラ⁶●ムVr1B/PigN[ほgu9へ¥⁴ᶠ◝b🐱⬅️`pM.Oヲソ69⁷W█+W_ᶜ:🐱⁶<●]む◜ルケ`いにW⁶uワsそヘa▒⁵wUオ⁴サケy⁷れv⁵gこナャRま⁵トもV⁵}ナ⁙¥4レメチト\tᵇn♥e█•Wれi3FᶠんVンュ:すs7ノIfめpさんはSょョちツ&ヒネ}gW⁷◝ニカョん⁴るはテM{✽ヘッ)▒ルクe。ソ*⁶、♪タpW|+ョ0RエZRュ^マにV▒やル/ト█ホルッロVLク⬅️ク🐱Zセ⁵▶5ハ{_にpワ∧❎\rヲラ=]エurん}.ᵇWᶜソウエソ\r'>゜gヤやつ⁷iエ\0よ4ネャV🐱F⁴_\nオヤタヲ11ッツレ◜の▥そ}ヤト◆OW゜7わs³☉\n\0ケタョv'ゆゅNeᵉロミrp\rdヲヤᵇやVPいうチ◝Lわほコ¹えヒ♥サ◝オツイ|⬇️ょれT=ラチ¹^ユ⁙ひ\njhUコえそ❎Vアはせもzわトサ エヌ(SVvᵉ1}fク■ク😐ろ4ᶠ%なに⁷▒ャ&█%Rタh*◝W◝P○█モa█むt|ヌ⧗Xんた\\ょ⁶★█gVfV¥Wu=ョミG█`モンXjシソルo%ぬほe³\nきわV⧗ウト◆ヌ2\t▒エv○ˇz⌂uシᵉリS웃ぬ▤⧗TやAuフカトや²たG…\r8ホ⬅️ュe⁷かKク%Qr\0メfソ。ヲ>タfせV❎█_めい◀あアょ?せ❎ャ◜○cハンワuccC2Mョ+➡️⁷Iオ\r(゜⁷(Pキ…チ웃つxPS+キ\0サUスり⬆️スホ▒Vけ\0⌂⁵Uャホラし▒⁵rjハ█tン¥◜トsムmuクち|3█[V○♥░?ヲ◜0レイまヨ█{C`▤◝U⁶\0[p✽█さP\nWとPMハるワ▮ス⁶ンョ*ᶜ'ナ✽Lクリ⬅️▒Wuウ◆ヘユe⁵∧4セv◜9~_M[<わˇのマtにf}➡️█ワA◜³⁙Kり▒めル▒PvojクもMキ=.シ=k?f%|=\r゛ネ★◜\0とチ⁶に`…◝ラレ7や;ᵇ$kわu@…ヲせ⁷Rっ4ュ|{7▒キ1ア▤/QWSXLく`\rユJ◜🅾️▤ふVリッキu'jよレeゆあ~W■ろぬxリoマチoへコフKモル⁷ょかるツE▒P5M;、ュウYモqc★-⌂ろリ%キ⁸ˇe⁷。Oす⁵✽ᵉS=A█(v\nf⁴|ぬシシ◜ヘャ◝メ`|²⁷けugP¹:ほu○⌂_ゅ@ふ▤\\メKルちヲPわeへN●¹むV⁘よW、ョz▶]‖07ん⁷⁵\rmSしよnシ|Sッ;‖⁷gOせ⁙⁸な⁶\tヌeホVfルヨツ³~^\0ヨワッBpねf?ネ⧗ql⁶,,mうケ~イ、}kメ♪•uフネヒシ◝f\0◜‖i◜¹A]UV"


images = {
	moon,
	fish,
	krazykat
}

i = 1

function _init()
	zx0_decompress(
		str_get(images[i]),
		mem_get(0x8000),
		mem_set(0x8000)
	)
end

function _update()
	if btnp(❎) then
		i = i%#images + 1
		_init()
	end
end

function _draw()
 memcpy(0x6000, 0x8000,0x2000)
 
 print("\^o0ffcompressed size: " 
 						.. #images[i], 2,2,7) 
	print("\^o0ffuncompressed size: 8192",
						 2, 10, 7)
	
	print("\^o0ffpress ❎ to change picture",
						 2, 121, 7)
end
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cc000000000000000000000000000000000000000ccccc0000000000000000ccccccc0000000000000cccccccccccccccccccccccccccccccccccccccccccccc
c00770077077707770777077700770077077707700ccc00770777077707770000cccc0707077707770cccccccccccccccccccccccccccccccccccccccccccccc
c07000707077707070707070007000700070007070ccc07000070000707000070cccc0707070000070cccccccccccccccccccccccccccccccccccccccccccccc
c070c0707070707770770077007770777077007070ccc0777007000700770c000cccc0777077707770cccccccccccccccccccccccccccccccccccccccccccccc
c07000707070707000707070000070007070007070ccc00070070070007000070cccc0007000707000cccccccccccccccccccccccccccccccccccccccccccccc
c007707700707070c0707077707700770077707770ccc07700777077707770000cccccc07077707770cccccccccccccccccccccccccccccccccccccccccccccc
cc00000000000000c0000000000000000000000000ccc00000000000000000ccccccccc00000000000cccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c00000000c000000000000000000000000000000000000000ccccc0000000000000000ccccccc00000000000000000cccccccccccccccccccccccccccccccccc
c0707077000770077077707770777077700770077077707700ccc00770777077707770000cccc07770770077707770cccccccccccccccccccccccccccccccccc
c0707070707000707077707070707070007000700070007070ccc07000070000707000070cccc07070070070700070cccccccccccccccccccccccccccccccccc
c07070707070c0707070707770770077007770777077007070ccc0777007000700770c000cccc07770070077707770cccccccccccccccccccccccccccccccccc
c0707070707000707070707000707070000070007070007070ccc00070070070007000070cccc07070070000707000cccccccccccccccccccccccccccccccccc
c00770707007707700707070c0707077707700770077707770ccc07700777077707770000cccc077707770c0707770cccccccccccccccccccccccccccccccccc
cc0000000000000000000000c0000000000000000000000000ccc00000000000000000ccccccc000000000c0000000cccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc777777ccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccc7777777777cccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccc777777777777ccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccc777777777777cccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccc77777777777777cccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccc77777777777777cccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccc7777777777777777cccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccc7777777777777777ccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccc7777777777777777ccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccc7777777777777777cccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccc7777777777777777cccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccc77777777777777cccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccc77777777777777cccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccc777777777777ccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccc777777777777cccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccc7777777777ccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc777777ccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccc11111111ccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccc111111111111ccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccc1111111111111111cccccccccaccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccc111111111111111111cccccccccaaaccccccccccaaaaaaaaaaaaaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccc1111111111111111111111ccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacccccccc1111111cccccccccccccccccccccccccccccccccccccccccc
ccc111111111111111111111111ccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccc11111111111cccc11111111111111cccccccccccccccccccccc
ccc111111111111111111111111cccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacccccc1111111111111111111111111111111111111cccccccccccccccc
cc11111111111111111111111111cccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacccccc11111111111111111111111111111111111111111ccccccccccccc
c1111111111111111111111111111ccccccc111aaaaaaaaaaaaaaaaaaaaaaaaaaaccccccc11111111111111111111111111111111111111111111ccccccccccc
111111111111111111111111111111cc111111111aaaaaaaaaaaaaaaaaaaaaaa11111ccc11111111111111111111111111111111111111111111111ccccccccc
11111111111111111111111111111111111111111111aaaaaaaaaaaaaaaaa11111111111111111111111111111111111111111111111111111111111cccccccc
11111111111111111111111111111111111111111111111aaaaaaaaaaa111111111111111111111111111111111111111111111111111111111111111ccccccc
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111cccccc
111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111ccccc
111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111ccccc
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111ccc
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111dddddddddddddd1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111dddddddddddddddddddddddd11111111111111111111111111111111111111111111111111111111dddddddddd11111111111111111
111111111111111111dddddddddddddddddddddddddddddd11111111111111111111111111111111111111111111111111dddddddddddddddd11111111111111
111111111111111dddddddddddddddddddddddddddddddddddd11111111111111111111111111111111111111111111dddddddddddddddddddddd11111111111
1111111111111dddddddddddddddddddddddddddddddddddddddd1111111111111111111111111111111111111111dddddddddddddddddddddddddd111111111
11111111111dddddddddddddddddddddddddddddddddddddddddddd1111111111111111111111111111111111111dddddddddddddddddddddddddddd11111111
111111111dddddddddddddddddddddddddddddddddddddddddddddddd111111111111111111111111111111111dddddddddddddddddddddddddddddddd111111
11111111dddddddddddddddddddddddddddddddddddddddddddddddddd1111111111111111111111111111111dddddddddddddddddddddddddddddddddd11111
111111dddddddddddddddddddddddddddddddddddddddddddddddddddddd11111111111dddddddddddddd111dddddddddddddddddddddddddddddddddddd1111
11111dddddddddddddddddddddddddddddddddddddddddddddddddddddddd11111ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd111
1111dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd1ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd11
111ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd11
11ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd1
1ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
1ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd66666666666ddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666666666666ddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666666666666666666dddddddddd
ddddddddddd66666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd66666666666666666666666666666dddddddd
dddddddd66666666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666666666666666666666666666ddddddd
ddddd66666666666666666666666dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd66666666666666666666666666666666666ddddd
dddd6666666666666666666666666ddddddddd6666666666666dddddddddddddddddddddddddddddddddddd6666666666666666666666666666666666666dddd
dd66666666666666666666666666666dd66666666666666666666666dddddddddddddddddddddddddddddd666666666666666666666666666666666666666ddd
d6666666666666666666666666666666666666666666666666666666666ddddddddddddddddddddddddddd666666666666666666666666666666666666666ddd
66666666666666666666666666666666666666666666666666666666666666ddddddddddddddddddddddd66666666666666666666666666666666666666666dd
6666666666666666666666666666666666666666666666666666666666666666ddddddddddddddddddddd66666666666666666666666666666666666666666dd
66666666666666666666666666666666666666666666666666666666666666666ddddddddddddddddddd6666666666666666666666666666666666666666666d
666666666666666666666666666666666666666666666666666666666666666666dddddddddddddddddd6666666666666666666666666666666666666666666d
6666666666666666666666666666666666666666666666666666666666666666666ddddddddddddddddd66666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666dddddddddddddddd66666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666dddd66666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
60000000000000000000006666000000066660000000006666000000000000000600000000666000000000000000000000000000006666666666666666666666
60777077707770077007706660077777006660777007706660077070707770770007707770666077707770077077707070777077706666666666666666666666
60707070707000700070006660770707706660070070706660700070707070707070007000666070700700700007007070707070006666666666666666666666
60777077007700777077706660777077706666070070706660706077707770707070007706666077700700706607007070770077066666666666666666666666
60700070707000007000706660770707706666070070706660700070707070707070707000666070000700700007007070707070006666666666666666666666
60706070707770770077006660077777006666070077006660077070707070707077707770666070607770077007000770707077706666666666666666666666
60006000000000000000066666000000066666000000066666000000000000000000000000666000600000000000060000000000006666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666

