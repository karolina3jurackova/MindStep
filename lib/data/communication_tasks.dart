import 'package:adv_basics/models/app_task.dart';

const List<AppTask> communicationTasks = [
  AppTask(
    id: 'aktivni-naslouchani',
    name: 'Aktivní naslouchání',
    description: 'Každý den vědomě procvičuj plnou přítomnost v rozhovoru.',
    durationMinutes: 0,
    totalDays: 7,
    dailyFacts: [
      // Day 1
      'Dnes při každém rozhovoru vědomě odlož telefon a udržuj oční kontakt s druhým.',
      'Pouhá přítomnost telefonu na stole snižuje kvalitu konverzace o 20 % — mozek sleduje možná oznámení i bez vědomého záměru.',
      // Day 2
      'Opakuj klíčová slova partnera: "Takže říkáš, že..." Vnímej, jak to změní atmosféru.',
      'Parafrázování aktivuje v mozku druhé osoby pocit pochopení — zvyšuje důvěru a otevřenost k dalšímu sdílení.',
      // Day 3
      'Dnes nepřerušuj. Před každou odpovědí vyčkej 2 vteřiny poté, co druhý domluvil.',
      'Průměrný člověk přeruší partnera za méně než 17 vteřin. Záměrná pauza dává druhému prostor domyslet myšlenku.',
      // Day 4
      'Polož dnes jednu otevřenou otázku: "Co tě k tomu přivedlo?" nebo "Jak ses při tom cítil?"',
      'Otevřené otázky aktivují jiné části mozku než uzavřené — stimulují příběhové myšlení a emoční zpracování.',
      // Day 5
      'Vědomě se zdržuj paralelního myšlení — nepřipravuj odpověď, dokud druhý mluví.',
      'Lidé dokáží s 80% přesností rozpoznat, zda jejich partner skutečně naslouchá — tělo vysílá subtilní neverbální signály.',
      // Day 6
      'Jemně zrcadli postoj těla svého partnera. Všimni si, zda se atmosféra rozhovoru změní.',
      'Zrcadlení (mirroring) je nevědomý mozkovní mechanismus — aktivuje zrcadlové neurony a vytváří pocit empatie.',
      // Day 7
      'Na konci rozhovoru shrň, co jsi slyšel: "Pokud jsem tě správně pochopil, říkáš, že..."',
      'Shrnutí je nejvyšší forma aktivního naslouchání — vyžaduje zpracování celého kontextu, nejen posledních vět.',
    ],
    tips: [
      'Před rozhovorem si vědomě řekni: "Chci pochopit, ne odpovídat."',
      'Jakmile si všimneš, že připravuješ odpověď — zastav se. Naslouchání právě skončilo.',
      'Po rozhovoru si vzpomeň na 3 klíčové věci, které druhý říkal. Pokud je to těžké, naslouchání nebylo plné.',
      'Pokud ti myšlenky utíkají, vrať je jednoduchou frází v duchu: "Chci slyšet, co říkáš."',
    ],
  ),
  AppTask(
    id: 'empatie-v-praxi',
    name: 'Empatie v praxi',
    description: 'Vědomě cvič schopnost vidět situaci z perspektivy druhého.',
    durationMinutes: 0,
    totalDays: 7,
    dailyFacts: [
      // Day 1
      'Dnes v každém konfliktu nebo neshodě vědomě hledej pohled druhého: "Co to pro něj znamená?"',
      'Empatie není souhlas — je to schopnost vidět situaci z perspektivy druhého, aniž bychom vzdali svůj pohled.',
      // Day 2
      'Místo hodnocení použij popis: ne "To bylo nezdvořilé", ale "Cítil jsem se přehlížen, když..."',
      'Hodnotící jazyk spouští obranné reakce — popis pocitu otevírá konverzaci a snižuje defensivnost druhého.',
      // Day 3
      'Dnes zkus říct "Rozumím, že to pro tebe bylo těžké" — i tam, kde s druhou osobou nesouhlasíš.',
      'Validace emocí neznamená souhlas s jednáním. Mozek, který cítí pochopení, se méně brání a více spolupracuje.',
      // Day 4
      'Všimni si situace, kde bys normálně reagoval rychle — záměrně se zastav a nejdřív se zeptej.',
      'Emoční mozek (amygdala) reaguje o 200 ms dříve než racionální kortex. Záměrná pauza tuto mezeru překlenuje.',
      // Day 5
      'Popiš situaci tak, jak by ji pravděpodobně viděl druhý člověk — i kdyby se lišila od tvého pohledu.',
      'Teorie mysli — schopnost modelovat pohled druhého — je jednou z nejsložitějších lidských kognitivních funkcí.',
      // Day 6
      'Vědomě se zdrž rady nebo řešení, když ti druhý sdílí problém. Jen vyslechni a potvrď.',
      'Lidé nejčastěji chtějí být slyšeni, ne opraveni. Nabídnout radu dříve než pochopení uzavírá konverzaci.',
      // Day 7
      'Dnes si všimni, kdy tě situace nebo osoba "spustí". Co to říká o tobě — ne o nich?',
      'Silné emocionální reakce jsou vždy informací o nás samých — o naší historii, hodnotách a nezpracovaných zkušenostech.',
    ],
    tips: [
      'Empatie se cvičí jako sval — čím víc ji záměrně používáš, tím přirozenější se stává.',
      'Nezaměňuj empatii za sympatie: sympatie říká "Cítím to s tebou", empatie říká "Vidím, co cítíš ty".',
      'Kdykoliv tě situace irituje, zeptej se: "Co pravděpodobně prožívá ten druhý?" — to přeorientuje energii.',
      'Každý večer si vzpomeň na jednu situaci a přemýšlej, jak ji zažíval ten druhý.',
    ],
  ),
  AppTask(
    id: 'jasna-komunikace',
    name: 'Jasná komunikace',
    description:
        'Nauč se vyjadřovat jasně, přímo a bez zbytečné dvojznačnosti.',
    durationMinutes: 0,
    totalDays: 7,
    dailyFacts: [
      // Day 1
      'Před každou důležitou větou si v duchu řekni: "Co přesně chci sdělit?" Mluv až poté.',
      'Průměrný posluchač si po 24 hodinách pamatuje jen 10–25 % toho, co slyšel. Stručnost a jasnost výrazně zvyšují zapamatovatelnost.',
      // Day 2
      'Dnes říkej věci přímo: místo "Možná bychom mohli..." zkus "Navrhuji, abychom..."',
      'Nepřímá komunikace vytváří dvojznačnost — mozek druhého automaticky doplní mezery vlastní interpretací, která nemusí odpovídat tvému záměru.',
      // Day 3
      'Na konci každé důležité výměny se zeptej: "Rozuměl jsi mi správně, nebo jsem to nejasně vyjádřil?"',
      'Co říkáme a co druhý slyší se liší v průměru o 40–60 %. Ověření porozumění tuto mezeru zavírá.',
      // Day 4
      'Dnes nepoužívej slovo "vždy" ani "nikdy" v konfliktu. Všimni si, jak to změní reakce.',
      'Absolutní výrazy ("vždy", "nikdy") aktivují obranné mechanismy — mozek je vnímá jako útok, ne jako podnět k dialogu.',
      // Day 5
      'Sděluj záměr předem: "Chci se zeptat, jak se cítíš — nekomentuju, jen se ptám."',
      'Kontext záměru snižuje o 60 % pravděpodobnost, že druhý odpověď interpretuje defensivně.',
      // Day 6
      'Použij strukturu: Situace → Dopad → Potřeba. Například: "Když... / Cítím se... / Potřeboval bych..."',
      'Tato struktura (inspirovaná nonviolentní komunikací) prokazatelně snižuje eskalaci konfliktů v osobním i pracovním prostředí.',
      // Day 7
      'Dnes vědomě rozlišuj: je tohle TVŮJ problém nebo problém druhého? Sděluj jen to, co je tvoje.',
      'Projekce vlastních potřeb na druhé je jedním z nejčastějších zdrojů komunikačních nedorozumění — uvědomění si tohoto vzorce je první krok k jeho změně.',
    ],
    tips: [
      'Jasná komunikace začíná u sebe: věz, co chceš říct, než začneš mluvit.',
      'Vyhýbej se pasivním formulacím — používej přímé "Já" výroky.',
      'Když se domníváš, že druhý nereaguje správně, nejdřív ověř, zda pochopil, co jsi chtěl říct.',
      'Po důležité konverzaci si zapiš, co jsi sdělil a co druhý pravděpodobně slyšel. Rozdíl bývá překvapivý.',
    ],
  ),
  AppTask(
    id: 'nekritizuj-nechod-navrch',
    name: 'Nekritizuj, nechoď navrch',
    description:
        'Nauč se omezit kritiku, lépe vnímat druhé a reagovat bez odsuzování.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes jen pozoruj – nezasahuj. Všímej si každého momentu, kdy tě přepadne nutkání kritizovat. Večer si napiš, kolikrát se to stalo a v jakých situacích.',
      'Dale Carnegie zjistil, že 99 % lidí se nikdy nepokládá za vinné – bez ohledu na to, co udělali. Kritika proto téměř nikdy nefunguje.',

      // Day 2
      'Dnes pokaždé, když cítíš nutkání kritizovat, polož místo toho otázku. Například: „Co se tam stalo?“ nebo „Jak bys to příště pojal?“',
      'Lincoln napsal tvrdý kritický dopis generálu Meadovi po Gettysburgu, ale nikdy ho neodeslal. Pochopil, že kritika by věc nezměnila – jen by druhého zatvrdila.',

      // Day 3
      'Vyber si jednu osobu, kterou často kritizuješ. Po celý den hledej alespoň jednu věc, kterou dělá dobře – a řekni jí to.',
      'Hans Selye řekl: „Stejně jako žízníme po uznání, bojíme se odsouzení.“ Kritika aktivuje obranné reakce podobné pocitu ohrožení.',

      // Day 4
      'Dnes se zdrž kritiky i v myšlenkách. Když si všimneš negativního soudu, nahraď ho větou: „Jedná tak, jak to ze svého pohledu vidí správně.“',
      'Carnegie ukazoval rozdíl mezi obávaným vedením a vedením založeným na respektu. Lidé přirozeně lépe reagují na pochopení než na odsouzení.',

      // Day 5
      'Vzpomeň si na situaci, kdy jsi někoho tvrdě kritizoval. Napiš si 3 věty o tom, co jsi tehdy mohl říct jinak.',
      'Negativní zpětná vazba může aktivovat amygdalu – centrum strachu. V obranném stavu se schopnost učit a přijímat zpětnou vazbu výrazně snižuje.',

      // Day 6
      'Dnes pozoruj, jak ostatní lidé kritizují. Všímej si reakce kritizovaného i změny atmosféry.',
      'Benjamin Franklin si uvědomil, že jeho sklon přít se a kritizovat odrazoval lidi. Později se naučil mluvit mírněji a stal se mnohem vlivnějším.',

      // Day 7
      'V jedné situaci, kde bys normálně kritizoval, popiš jen fakta bez hodnocení. Například: „Výsledek byl XY. Jak to vidíš ty?“',
      'Popisný jazyk snižuje obranu. „Zpráva přišla o dvě hodiny později“ působí jinak než „Zase jsi nestihl termín.“',

      // Day 8
      'Dnes sleduj sebekritiku. Když se přistihneš při tvrdém hodnocení sebe sama, zeptej se: „Co by mi řekl laskavý přítel?“',
      'Mark Twain psal rozzuřené dopisy, které jeho žena často neposlala. Už samotné napsání mu pomohlo ulevit si bez poškození vztahů.',

      // Day 9
      'Dnes najdi příležitost pochválit místo kritizování. Řekni konkrétně: „Tady jsem si všiml, že jsi to udělal dobře.“',
      'Týmy, kde vedoucí častěji chválí než kritizuje, bývají produktivnější. Pozitivní zpětná vazba posiluje motivaci i důvěru.',

      // Day 10
      'Porovnej první den s dneškem. Napiš si 3 situace, kde ses zdržel kritiky, a jaký to mělo výsledek.',
      'Carnegie o Lincolnovi ukazoval, že nekritizovat není slabost. Je to disciplína člověka, který dokáže vést druhé bez zbytečného ponižování.',
    ],
    tips: [
      'Nehodnoť se za to, kolikrát tě napadne kritizovat. Cílem je nejdřív všimnout si vlastního vzorce.',
      'Otázka místo kritiky dává druhému prostor přijít k závěru sám.',
      'Když je těžké najít něco pozitivního, začni od maličkostí.',
      'Pochopení pohledu druhého neznamená, že s ním souhlasíš.',
      'Ptej se: „Co bych mohl říct jinak?“ místo „Proč jsem to pokazil?“',
      'Pozorování kritiky u druhých ti pomůže lépe vidět vlastní chování.',
      'Používej popisný jazyk bez nálepek a hodnocení.',
      'Nekritizovat druhé začíná tím, že nebudeš tvrdě kritizovat ani sebe.',
      'Pochvala a absence kritiky nejsou totéž. Procvičuj obojí.',
      'Vrať se k tomuto tasku po měsíci a sleduj, jestli se tvoje reakce změnily.',
    ],
  ),
  AppTask(
    id: 'uprimna-pochvala',
    name: 'Upřímná pochvala',
    description:
        'Nauč se dávat konkrétní, upřímnou pochvalu a lépe oceňovat druhé i sebe.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes pochval jednoho člověka – konkrétně a upřímně. Nevybírej nadřízené nebo přátele. Vyber někoho „neviditelného“: recepční, číšníka nebo kolegu v pozadí. Řekni mu přesně, co oceňuješ.',
      'William James z Harvardu řekl: „Nejhlubším principem lidské povahy je touha být oceněn.“ Bylo to napsáno už v roce 1890 – a za více než 130 let se na tom nic nezměnilo.',

      // Day 2
      'Dnes pochval alespoň dvě různé osoby. Jedna z nich ať je blízká – partner, kamarád, sourozenec nebo někdo, u koho pochvalu často zanedbáváš.',
      'Carnegie psal o „hladu po pochvale“. Potřeba ocenění je velmi silná – jen bývá méně viditelná než běžný hlad.',

      // Day 3
      'Dnes napiš pochvalnou zprávu nebo e-mail. Komukoli – kolegovi, učiteli nebo poskytovateli služby. Písemná pochvala je vzácnější než slovní a může zůstat dlouho.',
      'Stevie Wonder přiznal, že jeho kariérní směr ovlivnila věta pochvaly od učitelky, která ocenila jeho sluch. Jedno upřímné uznání může změnit trajektorii života.',

      // Day 4
      'Dnes si všímej, kdy druzí čekají na pochvalu a nedostávají ji. Jaké výkony kolem tebe projdou nepovšimnuty? Vyber jeden a pojmenuj ho.',
      'Carnegie ukazoval, že rutina často zabíjí vděčnost. Věci, které fungují každý den, si často začneme uvědomovat až tehdy, když přestanou fungovat.',

      // Day 5
      'Dnes pochval veřejně – před ostatními. Ocenění před skupinou má silný efekt: potěší příjemce a zároveň inspiruje ostatní.',
      'Andrew Carnegie chválil své zaměstnance veřejně i soukromě. Na svůj náhrobek si přál větu o tom, že kolem sebe dokázal shromáždit lidi chytřejší, než byl on sám.',

      // Day 6
      'Dnes se zaměř na pochvalu procesu, ne výsledku. Místo „Dopadlo to skvěle“ řekni třeba: „Bylo vidět, kolik práce jsi do toho dal.“',
      'Výzkum Carol Dweck ukázal, že pochvala za snahu a proces podporuje lepší výkon než pochvala za vrozený talent. Pomáhá budovat takzvaný growth mindset.',

      // Day 7
      'Dnes pochval sám sebe. Napiš si tři věci, které jsi za posledních 7 dní udělal dobře. Bez podmínek, bez „ale“. Jen čistá pochvala pro sebe.',
      'Alfred Lunt řekl: „Nic nepotřebuji tolik jako potravu pro zachování sebeúcty.“ Sebeúcta není arogance – je to základ, ze kterého můžeš oceňovat i druhé.',

      // Day 8
      'Dnes pochval spontánně – bez přípravy a plánování. Kdykoli si během dne všimneš něčeho, co si zaslouží uznání, řekni to okamžitě.',
      'Divadelní podnikatel Ziegfeld posílal sboristkám telegramy i růže – i těm méně viditelným. Věřil, že každý člověk se cítí lépe, když ví, že si ho někdo všiml.',

      // Day 9
      'Dnes pochval někoho, s kým máš napjatý vztah nebo s kým nesouhlasíš. Najdi v jeho práci nebo přístupu něco, co můžeš upřímně ocenit.',
      'Rockefeller ocenil spolupracovníka Bedforda za to, že „zachránil 60 % peněz“, i když jeho rozhodnutí firmu stálo velkou částku. Ocenění dokáže změnit loajalitu i atmosféru.',

      // Day 10
      'Zamysli se: Kdo ve tvém životě dostává pochvalu nejméně – a přitom by si ji zasloužil nejvíce? Napiš mu dnes delší, upřímnou pochvalu.',
      'Carnegie radil zanechávat za sebou „jiskřičky vděčnosti“. Z malých projevů ocenění mohou vzniknout silnější vztahy a větší důvěra.',
    ],
    tips: [
      'Konkrétní pochvala je silnější než obecná. „Tvoje zpráva mi ušetřila hodinu práce“ působí lépe než „Jsi šikovný.“',
      'Pochvalu blízkému člověku říkej osobně, ne jen jako rychlou zprávu.',
      'Písemná pochvala není slabost. Právě proto, že je vzácná, může mít velký dopad.',
      'Nečekej, až někdo začne pochvalu potřebovat viditelně. Dej ji dřív.',
      'Veřejná pochvala funguje jen tehdy, když je upřímná a nepřehnaná.',
      'Chval snahu, přístup a proces – nejen výsledek.',
      'Sebeochvala není narcismus. Je to mentální hygiena.',
      'Spontánní pochvala bývá často nejautentičtější.',
      'Pochvala člověka, se kterým máš napětí, může změnit dynamiku vztahu.',
      'Pochvala je investice do vztahů. Nestojí peníze, jen pozornost.',
    ],
  ),
  AppTask(
    id: 'vzbud-zajem-hovor-o-pranich-druheho',
    name: 'Vzbuď zájem – hovoř o přáních druhého',
    description:
        'Nauč se lépe vnímat, co chce druhý člověk, a formulovat své žádosti z jeho pohledu.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si před každou žádostí nebo přesvědčováním polož otázku: „Co chce ten druhý?“ Napiš si ji fyzicky na papírek nebo do telefonu jako připomenutí.',
      'Carnegie používal jednoduchou metaforu: měl rád jahody se smetanou, ale ryby mají raději červy. Proto jim nenabízel to, co chutná jemu, ale to, co chtějí ony.',

      // Day 2
      'Dnes v jednom rozhovoru formuluj svou žádost z pohledu přínosu pro druhého. Začni větou: „Pro tebe by to znamenalo…“ nebo „To by ti pomohlo s…“',
      'Barbara Andersonová napsala 12 bankám v Phoenixu ne o tom, co chce ona, ale o tom, co může dát jim. Výsledek byl výrazně lepší než u běžné žádosti.',

      // Day 3
      'Dnes si všímej, jak často mluvíš o sobě a svých potřebách. Spočítej, kolikrát řekneš „já“, „mně“ nebo „moje“ a kolikrát mluvíš o zájmech druhého. Jen měř – bez hodnocení.',
      'Newyorská telefonní společnost zjistila, že v 500 analyzovaných hovorech bylo slovo „já“ použito 3990krát. Lidé přirozeně myslí hlavně na sebe a své potřeby.',

      // Day 4
      'Dnes se pokus zjistit zájem nebo potřebu člověka, s nímž budeš jednat, ještě před schůzkou nebo rozhovorem. Věnuj 5 minut přemýšlení o tom, co ho trápí nebo co chce.',
      'Theodore Roosevelt se před návštěvami připravoval na zájmy svých hostů. Když přijel kovboj, četl o rančích. Když diplomat, četl o diplomacii. Hosté pak cítili, že rozumí jejich světu.',

      // Day 5
      'Dnes v jednom obtížném rozhovoru vědomě odlož své argumenty na druhou polovinu konverzace. První polovinu věnuj pochopení toho, co chce druhý.',
      'Harry A. Overstreet říkal, že činnost vychází z přání. Kdo chce přesvědčovat, měl by nejprve vzbudit v druhém intenzivní přání.',

      // Day 6
      'Dnes místo přímého příkazu nebo prosté žádosti najdi způsob, jak v druhém vzbudit vlastní chuť udělat to, co potřebuješ. Ukaž mu skutečnou hodnotu pro něj.',
      'Carnegie popisoval příběh, kdy rodiče místo příkazu ke školce ukázali dítěti, co ho tam může bavit. Vzbuzený zájem byl silnější než samotný příkaz.',

      // Day 7
      'Dnes si vzpomeň na situaci z minulosti, kdy ti přesvědčování nevyšlo. Zkus zpětně zanalyzovat, jestli jsi mluvil o tom, co chceš ty, nebo o tom, co chce druhý.',
      'Carnegie analyzoval neúspěšné prodejní rozhovory a zjistil, že lidé často mluvili hlavně o svém produktu, svých potřebách a svých cílech – ne o zákazníkovi.',

      // Day 8
      'Dnes si v jedné situaci dej závazek: nebudeš nic žádat, dokud nepochopíš, co druhý potřebuje. Začni konverzaci pouze otázkami a naslouchej.',
      'Obchodník Duvernoy roky neuspěl s nabídkami hotelovému řediteli. Když se začal zajímat o jeho koníček, vztah se změnil a ředitel si ho nakonec zavolal sám.',

      // Day 9
      'Dnes najdi průnik mezi tím, co chceš ty, a tím, co chce druhý. Napiš si dva sloupce: „Co chci já“ a „Co chce on/ona“ – a hledej společný bod.',
      'Lloyd George říkal, že se naučil dávat rybám návnadu, jaká jim chutnala. Právě schopnost mluvit k přáním druhých mu pomáhala politicky přežít.',

      // Day 10
      'Napiš si jednu žádost nebo přesvědčování, které tě čeká v nejbližší době. Připrav ho kompletně z pohledu druhého: co ho trápí, co chce dosáhnout a jak mu tvoje žádost pomůže.',
      'Carnegie ukazoval, že největší přesvědčovatelé netlačili. Vedli druhého tak, aby v řešení viděl vlastní zájem a vlastní nápad.',
    ],
    tips: [
      'Otázka „Co chce ten druhý?“ často stačí i bez složité analýzy.',
      'Věta „Pro tebe by to znamenalo…“ přepíná rozhovor z transakce na spolupráci.',
      'Nemusíš přestat mluvit o sobě. Jen vědomě přidej zájem o druhého.',
      'Pět minut přípravy na zájmy druhého může změnit celý rozhovor.',
      'Druhý bude otevřenější tvým argumentům, když cítí, že jeho zájem byl pochopen.',
      'Vzbudit zájem neznamená manipulovat. Znamená to ukázat skutečnou hodnotu pro druhého.',
      'Neúspěšné přesvědčování ber jako data, ne jako důvod k sebeobviňování.',
      'Začni otázkami: „Co tě teď trápí?“ „Čeho chceš dosáhnout?“ „Co by ti pomohlo?“',
      'Průnik zájmů je základ dohody, ze které mohou mít dobrý pocit obě strany.',
      'Příprava z pohledu druhého je často silnější než improvizace.',
    ],
  ),
  AppTask(
    id: 'uprimny-zajem-o-lidi',
    name: 'Upřímný zájem o lidi',
    description:
        'Nauč se rozvíjet skutečný zájem o druhé, více naslouchat a budovat hlubší vztahy.',
    durationMinutes: 0,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Dnes se zeptej jednoho člověka, s nímž obvykle mluvíš jen povrchně, na něco osobnějšího. Například: „Co tě momentálně nejvíc baví?“ nebo „Na čem teď pracuješ?“ A pak jen naslouchej.',
      'Alfred Adler říkal, že člověk, který se nezajímá o druhé, má v životě největší problémy a zároveň nejvíce ubližuje ostatním.',

      // Day 2
      'Dnes si při každém setkání všimni detailu o druhém – nálady, energie, změny vzhledu – a zmíň ho.',
      'Kouzelník Howard Thurston si před vystoupením opakoval, že má rád své publikum. Jeho úspěch nestál jen na triku, ale na skutečném zájmu o lidi.',

      // Day 3
      'Dnes si dej pravidlo: nemluv o sobě, dokud se druhý sám nezeptá. Veď rozhovor otázkami a zájmem o jeho svět.',
      'Carnegie byl jednou označen za skvělého konverzátora, i když téměř nemluvil – jen naslouchal a kladl otázky.',

      // Day 4
      'Dnes si zapamatuj jednu konkrétní věc z něčího života a příště se na ni zeptej.',
      'Theodore Roosevelt byl známý tím, že si pamatoval jména i drobnosti ze života lidí, což budovalo silné vztahy a loajalitu.',

      // Day 5
      'Dnes se věnuj někomu, koho dobře neznáš – novému kolegovi, sousedovi nebo vzdálenému známému.',
      'Carnegie tvrdil, že více přátel získáš za dva měsíce upřímným zájmem o druhé než za dva roky snahou zaujmout.',

      // Day 6
      'Dnes se pokus omezit mluvení o sobě. Když začneš větu „já…“, zkus ji přeformulovat jako otázku na druhého.',
      'Výzkum ukázal, že lidé používají slovo „já“ extrémně často. Zaměření na druhé je proto vzácné a silné.',

      // Day 7
      'Dnes vyhledej člověka, o kterého se ostatní moc nezajímají, a věnuj mu pozornost.',
      'Edward Bok se stal úspěšným tím, že se upřímně zajímal o druhé – i slavné osobnosti, kterým psal už jako mladý.',

      // Day 8
      'Dnes zjisti, co někoho trápí nebo zaměstnává. Neřeš to za něj – jen naslouchej.',
      'Novinář Isaac Marcosson zjistil, že schopnost naslouchat je vzácnější než jiné dovednosti – a přitom se dá naučit.',

      // Day 9
      'Dnes věnuj 5 minut přípravě před důležitým setkáním. Přemýšlej o tom, co druhého zajímá nebo prožívá.',
      'Detaily o lidech – jejich zájmy, rodina nebo koníčky – vytvářejí přirozenou sympatii a důvěru.',

      // Day 10
      'Dnes kontaktuj někoho, s kým jsi dlouho nemluvil. Napiš nebo zavolej bez konkrétního důvodu.',
      'Carnegie si zapisoval narozeniny přátel a posílal přání. Často byl jediný, kdo si vzpomněl – a to budovalo silné vztahy.',

      // Day 11
      'Dnes se zdrž rad. Když tě napadne poradit, místo toho se zeptej: „A co s tím plánuješ dělat?“',
      'Sigmund Freud byl známý tím, že dokázal hluboce naslouchat. Lidé se s ním cítili vyslyšeni a pochopeni.',

      // Day 12
      'Dnes si nastav připomínku během dne: „Zajímal jsem se dnes o někoho?“ Pokud ne, najdi příležitost.',
      'Zájem o druhé není otázka času nebo věku – je to vědomé rozhodnutí, které může změnit vztahy v jakékoli fázi života.',

      // Day 13
      'Dnes si po rozhovorech zapisuj 1–2 věci, které ses o druhých dozvěděl.',
      'Jim Farley si pamatoval tisíce jmen a detailů o lidech, což mu pomohlo budovat silné vztahy a vliv.',

      // Day 14
      'Zamysli se nad posledními 14 dny. Co nového ses dozvěděl o lidech kolem sebe? Kdo tě překvapil?',
      'Carnegie říkal, že přátelství založené na skutečném zájmu vydrží celý život, zatímco vztahy založené na vlastním prospěchu rychle mizí.',
    ],
    tips: [
      'Upřímný zájem se nedá dlouho předstírat – ale dá se vědomě rozvíjet.',
      'Všímej si detailů. Malé věci často znamenají nejvíc.',
      'Nejlepší konverzace vznikají z naslouchání, ne z mluvení.',
      'Pamatuj si, co lidé říkají – a vracej se k tomu.',
      'Každý člověk je expert na svůj vlastní život.',
      'Omez mluvení o sobě a přidej více otázek.',
      'Zajímej se i o ty, které ostatní přehlížejí.',
      'Neřeš hned problémy druhých – nejdřív je pochop.',
      'Krátká příprava před rozhovorem může zásadně změnit jeho průběh.',
      'Zapisování detailů o lidech je forma péče o vztahy.',
      'Ne vždy musíš radit – často stačí naslouchat.',
      'Používej připomínky k budování návyku.',
      'Dlouhodobý zájem vytváří hluboké vztahy.',
      'Zájem o lidi je dovednost na celý život.',
    ],
  ),
  AppTask(
    id: 'sila-usmevu',
    name: 'Síla úsměvu',
    description:
        'Nauč se vědomě používat úsměv jako nástroj pro lepší náladu, komunikaci a vztahy.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes ráno se podívej do zrcadla a vědomě se usměj. Drž to 10 sekund. Pak jdi do dne s tímto záměrem: usmívat se na každého, s kým se setkáš.',
      'Výzkumy ukazují, že i nucený úsměv aktivuje v mozku centra spojená s pozitivními emocemi. Tělo ovlivňuje mysl.',

      // Day 2
      'Dnes se usmívej při telefonování. Připomeň si to lístečkem „USMĚJ SE“. Sleduj, jak druhý reaguje na tvůj hlas.',
      'Testy telefonních společností ukázaly, že úsměv je slyšet i přes telefon. Mění tón hlasu i reakci druhé strany.',

      // Day 3
      'Dnes se vědomě usměj na člověka, od kterého úsměv nečekáš. Sleduj, co to udělá s atmosférou.',
      'Lidé, kteří se více usmívají, bývají vnímáni jako přístupnější a efektivnější v komunikaci i vedení.',

      // Day 4
      'Dnes buď první, kdo se usměje – v každém setkání. Nečekej na druhé.',
      'Iniciativa v úsměvu často mění dynamiku vztahů. Kdo začne, nastavuje tón celé interakce.',

      // Day 5
      'Dnes se usmívej i na sebe – při chybách nebo nepříjemnostech reaguj s lehkostí a humorem.',
      'William James popsal, že naše jednání ovlivňuje emoce. Když jednáme vesele, začneme se tak i cítit.',

      // Day 6
      'Dnes si uvědom, kdy je pro tebe nejtěžší se usmívat – a právě v těch situacích to zkus.',
      'Úsměv v napjatých situacích má největší dopad. Dokáže změnit atmosféru rychleji než slova.',

      // Day 7
      'Dnes udělej experiment: dopoledne bez vědomého úsměvu, odpoledne se usmívej na každého. Porovnej reakce lidí.',
      'Krátký úsměv může mít dlouhodobý dopad. Lidé si ho pamatují mnohem déle než samotný rozhovor.',

      // Day 8
      'Dnes se usměj pokaždé, když odpovídáš na otázku – i nepříjemnou. Úsměv jako první reakce změní tón dialogu.',
      'V mnoha kulturách je úsměv základní součástí důvěry. Bez něj je komunikace chladnější a méně otevřená.',

      // Day 9
      'Dnes si napiš 3 lidi, na které měl tvůj úsměv v posledních dnech vliv. Co se změnilo?',
      'Úsměv může být pro druhé silným signálem přijetí – zvlášť pokud ho předtím nezažívali.',

      // Day 10
      'Dnes se usmívej jako obvykle – a navíc řekni jedné osobě, co pro tebe úsměv znamená.',
      'Úsměv nic nestojí, ale má hodnotu pro obě strany. Je to jednoduchý nástroj s velkým dopadem.',
    ],
    tips: [
      'Nemusíš čekat na dobrou náladu – úsměv ji může vytvořit.',
      'Úsměv je slyšet i v hlase, nejen vidět na tváři.',
      'Použij úsměv i v náročných situacích – právě tam má největší sílu.',
      'Být první, kdo se usměje, je projev jistoty.',
      'Zkus reagovat na chyby s humorem místo frustrace.',
      'Identifikuj situace, kde je pro tebe úsměv nejtěžší.',
      'Experimentuj a sleduj reálné reakce lidí kolem sebe.',
      'Používej úsměv jako první reakci – dá ti čas i klid.',
      'Všímej si dopadu svého chování na ostatní.',
      'Úsměv je návyk – čím víc ho trénuješ, tím přirozenější bude.',
    ],
  ),
  AppTask(
    id: 'pamatuj-si-jmeno',
    name: 'Pamatuj si jméno',
    description:
        'Nauč se lépe pamatovat jména lidí a používat je přirozeně v komunikaci.',
    durationMinutes: 0,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Dnes při každém setkání zopakuj jméno hned po představení a ještě jednou na konci rozhovoru.',
      'Jim Farley si pamatoval jména desítek tisíc lidí. Jméno je silný nástroj vlivu i vztahů.',

      // Day 2
      'Dnes používej jména lidí, které znáš, ale běžně je neoslovuješ jménem.',
      'Mozek reaguje na vlastní jméno aktivací centra odměny. Je to silný osobní stimul.',

      // Day 3
      'Dnes si vytvoř systém: spoj jméno s vizuálním detailem nebo asociací.',
      'Napoleon III. si zapisoval jména a vědomě je ukládal do paměti. Používal jednoduchý, ale systematický přístup.',

      // Day 4
      'Dnes se zeptej na jméno někoho, koho běžně přehlížíš, a použij ho ještě tentýž den.',
      'Použití jména je znak respektu a profesionality. Lidé si ho pamatují.',

      // Day 5
      'Dnes se neboj zeptat znovu na jméno, pokud ho nezachytíš. Raději se zeptej než ho komolit.',
      'Správně vyslovené jméno může vytvořit silný dojem a dlouhodobý vztah.',

      // Day 6
      'Dnes si v hlavě procvič jména lidí, které znáš, ale nepoužíváš je aktivně.',
      'Paměť na jména není talent, ale dovednost, kterou lze trénovat.',

      // Day 7
      'Dnes si zapisuj jména lidí po kontaktu a přidej k nim jednu informaci.',
      'Systémy jako CRM jsou založené právě na zapamatování jmen a detailů o lidech.',

      // Day 8
      'Dnes kontaktuj někoho z minulého týdne a zmíň jeho jméno i detail z rozhovoru.',
      'Kombinace jméno + osobní detail vytváří silnou vazbu a důvěru.',

      // Day 9
      'Dnes si zapamatuj jméno a jednu vlastnost u každého nového člověka. Večer si to otestuj.',
      'Lidé s „špatnou pamětí na jména“ většinou nemají strategii, ne problém s pamětí.',

      // Day 10
      'Dnes překvap někoho tím, že si vzpomeneš na starší detail, který zmínil.',
      'Jméno je úzce spojeno s identitou a emocemi – proto má tak silný dopad.',

      // Day 11
      'Dnes pojmenuj myšlenku, projekt nebo nápad po člověku, který k němu přispěl.',
      'Pojmenování po člověku posiluje pocit uznání a motivaci.',

      // Day 12
      'Dnes se pokus zapamatovat a použít jména alespoň 5 lidí během dne.',
      'Pravidelný trénink rychle zlepšuje schopnost zapamatovat si jména.',

      // Day 13
      'Dnes si napiš seznam jmen lidí z tvého okolí a otestuj si jejich zapamatování.',
      'Zapomenuté nebo zkomolené jméno lidé často vnímají silněji než jiné chyby.',

      // Day 14
      'Dnes oslov jménem každého, s kým mluvíš, včetně rozloučení.',
      'Použití jména dává konverzaci osobní rozměr a zanechává silnější dojem.',
    ],
    tips: [
      'Opakuj jméno minimálně 2–3× během rozhovoru.',
      'Používej jména i u lidí, které znáš dlouho.',
      'Vytvářej si mentální asociace ke jménům.',
      'Neboj se zeptat znovu na jméno.',
      'Zapisuj si jména a detaily – pomůže to paměti.',
      'Spojuj jméno s konkrétní osobní informací.',
      'Pravidelně si jména procvičuj.',
      'Používej jméno i při rozloučení.',
      'Pamatuj, že jméno je pro člověka velmi důležité.',
      'Buduj si vlastní systém zapamatování.',
      'Testuj si paměť bez pomůcek.',
      'Využívej jména k budování vztahů.',
      'Buď důsledný – z návyku se stane přirozenost.',
      'Čím víc jména používáš, tím snazší to bude.',
    ],
  ),
  AppTask(
    id: 'bud-pozornym-posluchacem',
    name: 'Buď pozorným posluchačem',
    description:
        'Nauč se skutečně naslouchat, vnímat druhé do hloubky a budovat silnější vztahy skrze pozornost.',
    durationMinutes: 0,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Dnes v každém rozhovoru počkej 3 sekundy po tom, co druhý domluví, než začneš mluvit.',
      'Sigmund Freud byl známý svou schopností hluboce naslouchat. Lidé si pamatovali jeho pozornost celý život.',

      // Day 2
      'Dnes veď alespoň jeden rozhovor bez telefonu v ruce nebo na stole.',
      'Výzkumy ukazují, že i vypnutý telefon na stole snižuje kvalitu konverzace a důvěru.',

      // Day 3
      'Dnes se zdrž rad. Místo nich se ptej: „A jak to vidíš ty?“',
      'Mnoho lidí nepotřebuje řešení, ale prostor být vyslyšeni.',

      // Day 4
      'Dnes aktivně používej neverbální signály – oční kontakt, přikývnutí, otočení těla k mluvčímu.',
      'Naslouchání není pasivní. Tělo komunikuje, zda skutečně věnuješ pozornost.',

      // Day 5
      'Dnes sleduj, kolikrát přerušíš druhého – i drobně. Večer si číslo zapiš.',
      'Lidé přerušují v průměru velmi často. Skutečné nepřerušované naslouchání je vzácné.',

      // Day 6
      'Dnes po důležitém rozhovoru shrň vlastními slovy, co druhý řekl.',
      'Shrnutí pomáhá ověřit porozumění a ukazuje druhému, že byl skutečně slyšen.',

      // Day 7
      'Dnes naslouchej někomu, kdo se potřebuje vypovídat. Bez rad a hodnocení.',
      'Pouhé naslouchání často dokáže uklidnit situaci víc než jakékoliv řešení.',

      // Day 8
      'Dnes hledej za slovy emoce a záměr. Co chce druhý skutečně říct?',
      'Schopnost zachytit emoce za slovy je klíčová pro hluboké porozumění.',

      // Day 9
      'Dnes si vytvoř 30 minut bez rušení – bez telefonu, hudby nebo multitaskingu.',
      'Ticho a plná pozornost umožňují hlubší vnímání druhých i sebe.',

      // Day 10
      'Dnes nejprve plně pochop pohled druhého, než sdílíš svůj názor.',
      'Naslouchání vyžaduje respekt a zvědavost – ne jen čekání na vlastní reakci.',

      // Day 11
      'Dnes si identifikuj svou slabinu v naslouchání a sleduj ji celý den.',
      'Aktivní naslouchání zvyšuje zapamatování informací a kvalitu vztahů.',

      // Day 12
      'Dnes si po rozhovorech zapisuj, co jsi slyšel a co bylo za slovy.',
      'Reflexe po rozhovoru pomáhá zlepšit schopnost naslouchání.',

      // Day 13
      'Dnes naslouchej člověku, s nímž máš napjatý vztah – bez obhajoby.',
      'Trpělivé naslouchání může změnit i konfliktní vztahy.',

      // Day 14
      'Zamysli se nad změnou za posledních 14 dní. Co se zlepšilo?',
      'Naslouchání je dovednost, která se s praxí neustále prohlubuje.',
    ],
    tips: [
      '3 sekundy ticha po odpovědi často odhalí víc, než čekáš.',
      'Odlož telefon – plná pozornost je vzácná.',
      'Místo rad pokládej otázky.',
      'Používej neverbální signály zájmu.',
      'Nepřerušuj – ani z dobrého úmyslu.',
      'Shrnuj, co jsi slyšel.',
      'Ne každý potřebuje řešení – často stačí být slyšen.',
      'Vnímej emoce za slovy.',
      'Vytvářej prostor pro ticho.',
      'Odlož svůj názor, dokud plně nepochopíš druhého.',
      'Poznej své slabiny v naslouchání.',
      'Reflektuj rozhovory zpětně.',
      'Naslouchej i těm, s nimiž nesouhlasíš.',
      'Trénuj pravidelně – naslouchání se stane přirozené.',
    ],
  ),
  AppTask(
    id: 'hovor-o-tom-co-zajima-druheho',
    name: 'Hovoř o tom, co zajímá druhého',
    description:
        'Nauč se vést konverzace skrze témata, která jsou důležitá pro druhé, a budovat tak silnější spojení.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si před důležitým rozhovorem napiš: „Co tohoto člověka zajímá?“ a věnuj tomu 3 minuty.',
      'Theodore Roosevelt se připravoval na rozhovory studiem zájmů druhých – díky tomu si získával silný respekt.',

      // Day 2
      'Dnes se zeptej: „O čem by tento člověk mohl mluvit hodiny?“ a dej mu prostor.',
      'Lidé si pamatují ty, kteří se zajímají o jejich svět – ne ty, kteří mluví o sobě.',

      // Day 3
      'Dnes veď jeden rozhovor čistě z pohledu druhého – bez zmínky o svých tématech.',
      'Hovořit o tom, co zajímá druhého, je přímá cesta k jeho pozornosti a sympatii.',

      // Day 4
      'Dnes zjisti, co člověk dělá ve volném čase, a zmíň to v rozhovoru.',
      'Zájmy mimo práci často otevírají hlubší a autentičtější konverzace.',

      // Day 5
      'Dnes začni rozhovor tématem, které se týká druhého – jeho projekt, úspěch nebo zájem.',
      'Začátek konverzace určuje její směr. Správné téma otevře dveře.',

      // Day 6
      'Dnes si všímej detailů v prostředí druhého a použij je jako vstup do konverzace.',
      'Detaily jako knihy, fotky nebo předměty často odhalují skutečné zájmy člověka.',

      // Day 7
      'Dnes si před schůzkou napiš 3 věci, které druhého zajímají, a vědomě je použij.',
      'Příprava na zájmy druhého zvyšuje kvalitu i hloubku rozhovoru.',

      // Day 8
      'Dnes reflektuj: kdy jsi naposledy mluvil o zájmech druhého a jaký to mělo efekt.',
      'Konverzace zaměřená na druhého vytváří větší zapojení a otevřenost.',

      // Day 9
      'Dnes mluv s někým o tématu, které ti není blízké – s upřímnou zvědavostí.',
      'Zvídavost umožňuje najít hodnotu i v tématech, která ti nejsou přirozená.',

      // Day 10
      'Napiš si 5 lidí ze svého okolí a ke každému: „Co ho zajímá?“',
      'Znalost zájmů druhých je základ dlouhodobých vztahů i důvěry.',
    ],
    tips: [
      'Krátká příprava před rozhovorem má velký dopad.',
      'Hledej témata, o kterých druhý mluví s nadšením.',
      'Nemusíš mluvit o sobě – stačí vést druhého.',
      'Zajímej se i o život mimo práci.',
      'Začni konverzaci světem druhého, ne svým.',
      'Všímej si detailů v okolí lidí.',
      'Připrav si 2–3 témata předem.',
      'Reflektuj, co fungovalo a co ne.',
      'Buď zvědavý i na neznámá témata.',
      'Buduj si mapu zájmů lidí kolem sebe.',
    ],
  ),
  AppTask(
    id: 'vzbud-pocit-dulezitosti',
    name: 'Vzbuď pocit důležitosti',
    description:
        'Nauč se dávat druhým lidem pocit, že jsou důležití, a budovat tím silnější vztahy i důvěru.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes vědomě najdi jednu věc, v níž tě druhý člověk předčí, a řekni mu to upřímně.',
      'Ralph Waldo Emerson věřil, že každý člověk je v něčem lepší než my – a právě proto se od něj můžeme učit.',

      // Day 2
      'Dnes oceň někoho „neviditelného“ – člověka, jehož práce si většina lidí nevšímá.',
      'Jedno upřímné uznání může výrazně změnit sebevědomí a postoj člověka.',

      // Day 3
      'Dnes při žádosti nebo zadání vysvětli, proč jsi vybral právě tohoto člověka.',
      'Lidé chtějí cítit, že jsou vybráni z konkrétního důvodu – že mají hodnotu.',

      // Day 4
      'Dnes někomu předej odpovědnost jako projev důvěry, ne jen jako úkol.',
      'Důvěra dává lidem prostor růst a přijmout větší odpovědnost s hrdostí.',

      // Day 5
      'Dnes reaguj okamžitě, když si všimneš něčeho hodného ocenění.',
      'Okamžitá pochvala má výrazně silnější dopad než opožděná.',

      // Day 6
      'Dnes požádej někoho o radu a zdůrazni, že si vážíš jeho pohledu.',
      'Žádost o radu dává druhému pocit kompetence a důležitosti.',

      // Day 7
      'Dnes veřejně oceň příspěvek někoho, kdo zůstal v pozadí.',
      'Veřejné uznání posiluje loajalitu a motivaci více než soukromé.',

      // Day 8
      'Dnes si u každého člověka řekni: „V čem je lepší než já?“',
      'Tento přístup mění vztahy z konkurence na respekt a spolupráci.',

      // Day 9
      'Dnes dej někomu upřímné uznání, které může mít dlouhodobý dopad.',
      'Jedno slovo uznání může změnit směr života – nejen náladu na den.',

      // Day 10
      'Zamysli se nad tím, komu jsi dal pocit důležitosti a jaký to mělo efekt.',
      'Pocit důležitosti je jedna z nejsilnějších lidských potřeb a motivací.',
    ],
    tips: [
      'Hledej, v čem jsou druzí lepší než ty.',
      'Oceňuj i ty, které ostatní přehlížejí.',
      'Vysvětluj, proč si někoho vybíráš.',
      'Dávej důvěru, ne jen úkoly.',
      'Reaguj okamžitě, když vidíš něco pozitivního.',
      'Ptej se na radu – je to silné uznání.',
      'Oceňuj veřejně, když je to vhodné.',
      'Buduj respekt místo porovnávání.',
      'Neboj se dát silné, upřímné uznání.',
      'Pamatuj, že pocit důležitosti nic nestojí – a má obrovský dopad.',
    ],
  ),
  AppTask(
    id: 'nepri-se',
    name: 'Nepři se – vyhraješ jen tak',
    description:
        'Nauč se zvládat konflikty bez sporů a zaměřit se na výsledky místo potřeby mít pravdu.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si všímej momentů, kdy chceš mít navrch nebo se přít. Jen pozoruj.',
      'Většina sporů končí tím, že obě strany jsou ještě více přesvědčené o své pravdě.',

      // Day 2
      'Dnes při nesouhlasu řekni: „To je zajímavý pohled. Řekni mi víc.“',
      'Souhlas s částí názoru druhého často ukončí konflikt dřív, než začne.',

      // Day 3
      'Dnes si připomeň minulý spor a zhodnoť jeho skutečný přínos.',
      'Vyhraná hádka málokdy změní názor druhého člověka.',

      // Day 4
      'Dnes nech druhého „vyhrát“ v jedné neshodě a sleduj výsledek.',
      'Vyhnout se konfliktu může být hodnotnější než dokázat pravdu.',

      // Day 5
      'Dnes si polož otázku: „Chci mít pravdu, nebo dosáhnout výsledku?“',
      'Výsledek a vztah mají často větší hodnotu než samotná pravda.',

      // Day 6
      'Dnes najdi v názoru druhého alespoň jeden bod, ve kterém má pravdu.',
      'Souhlas v jedné části otevírá prostor pro spolupráci.',

      // Day 7
      'Dnes při vyhrocení situace udělej pauzu a vrať se k tématu později.',
      'Krátká pauza zabraňuje emocionálním reakcím a zhoršení konfliktu.',

      // Day 8
      'Dnes vědomě „prohraj“ drobný spor a sleduj, co to s tebou udělá.',
      'Malé ústupky často vedou k většímu klidu a lepším vztahům.',

      // Day 9
      'Dnes si před debatou polož otázku, zda může mít druhý částečně pravdu.',
      'Respekt k pohledu druhého snižuje napětí a obranné reakce.',

      // Day 10
      'Zhodnoť situace, kdy ses nepřel. Jaký byl výsledek?',
      'Nejlepší způsob, jak vyhrát spor, je často se mu vyhnout.',
    ],
    tips: [
      'Pozoruj své reakce bez hodnocení.',
      'Používej věty, které otevírají dialog.',
      'Analyzuj minulé konflikty.',
      'Někdy je lepší ustoupit.',
      'Zaměř se na výsledek, ne ego.',
      'Hledej body shody.',
      'Neboj se dát si pauzu.',
      'Zkus vědomě „prohrát“ malé věci.',
      'Připusť, že druhý může mít pravdu.',
      'Buduj vztahy místo vítězství.',
    ],
  ),
  AppTask(
    id: 'priznej-chybu-rychle',
    name: 'Přiznej chybu rychle',
    description:
        'Nauč se přiznávat chyby rychle, upřímně a bez obrany – a tím posilovat důvěru.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si všímej každé chyby a přiznej ji okamžitě, bez výmluv.',
      'Rychlé přiznání chyby často odzbrojí druhou stranu.',

      // Day 2
      'Dnes přiznej jednu starší chybu, kterou jsi dosud neotevřel.',
      'Přiznání staré chyby ukazuje charakter a integritu.',

      // Day 3
      'Dnes sleduj, kdy se chceš bránit – a místo toho přiznej alespoň část pravdy.',
      'Obranné reakce jsou přirozené, ale přiznání je vědomá volba.',

      // Day 4
      'Dnes přiznej chybu ještě předtím, než tě na ni někdo upozorní.',
      'Proaktivní přiznání chyby snižuje kritiku a napětí.',

      // Day 5
      'Dnes si přiznej jednu chybu sám sobě – bez sdílení s ostatními.',
      'Upřímnost k sobě je základ osobní integrity.',

      // Day 6
      'Dnes si před rozhodnutím polož otázku: „Mohu se mýlit?“',
      'Jazyk nejistoty zvyšuje důvěryhodnost a otevřenost.',

      // Day 7
      'Dnes přiznej chybu s lehkostí a humorem.',
      'Lidé vnímají otevřenost jako znak sebevědomí.',

      // Day 8
      'Dnes reaguj na opravu větou: „Máš pravdu, děkuji.“',
      'Jednoduché přijetí chyby je nejúčinnější reakce.',

      // Day 9
      'Dnes zvaž, zda někde čekáš na přiznání druhého místo svého.',
      'Být první v přiznání chyby je znak silného charakteru.',

      // Day 10
      'Zhodnoť situace, kde jsi přiznal chybu. Jaký byl výsledek?',
      'Přiznání chyby často vede k lepší spolupráci a důvěře.',
    ],
    tips: [
      'Používej jednoduché věty bez vysvětlování.',
      'Neboj se otevřít staré chyby.',
      'Zastav obranné reakce včas.',
      'Buď první, kdo chybu přizná.',
      'Pracuj i se sebereflexí.',
      'Používej jazyk nejistoty.',
      'Přidej lehkost a humor.',
      'Přijímej opravy s vděčností.',
      'Nevyčkávej na druhé.',
      'Buduj návyk upřímnosti.',
    ],
  ),
  AppTask(
    id: 'zacni-pratelsky',
    name: 'Začni přátelsky',
    description:
        'Nauč se začínat obtížné rozhovory přátelsky, s respektem a bez zbytečné obrany.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si před každým obtížným rozhovorem dej minutu a promysli, jak můžeš začít přátelsky.',
      'Lincoln říkal, že kapka medu přitáhne více much než galon žluče. Přátelský začátek otevírá cestu k druhému.',

      // Day 2
      'Dnes začni jeden obtížný telefonát nebo e-mail oceněním nebo otázkou o druhém.',
      'Prvních několik sekund rozhovoru často nastaví celé jeho emocionální pozadí.',

      // Day 3
      'Dnes při jednání s člověkem, s nímž máš napjatý vztah, záměrně začni přátelsky.',
      'Přátelský začátek dokáže změnit i postoj člověka, který je připravený bránit se.',

      // Day 4
      'Dnes si všímej, jak lidé začínají obtížné konverzace a jak na to druhá strana reaguje.',
      'Kritický začátek často vyvolá obranu ještě před samotným obsahem rozhovoru.',

      // Day 5
      'Dnes začni schůzku nebo poradu krátkou osobní, přátelskou větou.',
      'Krátký lidský úvod může změnit atmosféru celé pracovní konverzace.',

      // Day 6
      'Dnes zachyť jeden moment, kdy bys normálně začal defenzivně, a obrať ho přátelsky.',
      'Teplo a klid často přesvědčí více než tlak nebo tvrdost.',

      // Day 7
      'Dnes přidej přátelský začátek do písemné komunikace – zprávy nebo e-mailu.',
      'Psaná komunikace snadno působí chladně. Přátelský začátek jí vrací lidskost.',

      // Day 8
      'Dnes při nesouhlasu začni větou: „Rozumím, proč to tak vidíš…“ a až potom přidej svůj pohled.',
      'Pocit pochopení snižuje obranu a otevírá prostor pro dialog.',

      // Day 9
      'Dnes změň jednu vztahovou situaci, kde dlouho začínáš defenzivně nebo neutrálně.',
      'Starý komunikační vzorec lze změnit jedním vědomým přátelským začátkem.',

      // Day 10
      'Dnes začni každý rozhovor přátelsky a večer si zapiš, jaký byl rozdíl.',
      'Přátelský začátek není slabost. Je to způsob, jak vstoupit do rozhovoru bez zbraní.',
    ],
    tips: [
      'Jedna minuta přípravy může změnit celý rozhovor.',
      'Prvních 5 sekund investuj do tónu, ne do problému.',
      'Přátelskost s napjatým člověkem má největší dopad.',
      'Pozoruj druhé – uvidíš vlastní vzorce.',
      'Krátký small talk není ztráta času.',
      'Zachyť defenzivní začátky a změň je.',
      'I e-mail může začít lidsky.',
      'Věta „Rozumím, proč…“ vytváří most.',
      'Starý vzorec lze změnit okamžitě.',
      'Přátelský začátek nastavuje celý vztah.',
    ],
  ),
  AppTask(
    id: 'dostan-ano-ano',
    name: 'Dostaň „ano, ano“',
    description:
        'Nauč se vést rozhovor přes shodu, otázky a postupné přirozené souhlasy.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si před jedním přesvědčovacím rozhovorem napiš 3 otázky, na které druhý přirozeně odpoví „ano“.',
      'Sokrates neprosazoval názor přímo. Kladl otázky, díky nimž druhý sám došel k závěru.',

      // Day 2
      'Dnes se v jednom rozhovoru vyhni slovu „ale“. Nahraď ho slovy „a“, „a zároveň“ nebo „a přitom“.',
      'Slovo „ale“ často psychologicky smaže to pozitivní, co bylo řečeno před ním.',

      // Day 3
      'Dnes místo prosazování názoru polož sérii otázek, které druhého povedou k závěru.',
      'Série správných otázek může změnit přesvědčování v přirozené uvědomění.',

      // Day 4
      'Dnes začni přesvědčování oblastmi, kde se s druhým stoprocentně shodujete.',
      'Shoda na začátku rozhovoru zvyšuje ochotu slyšet i odlišný pohled.',

      // Day 5
      'Dnes si všimni, kdy začínáš z neshody, a záměrně začni tím, co sdílíte.',
      'Když druhý začne souhlasem, jeho mysl zůstává otevřenější.',

      // Day 6
      'Dnes formuluj návrh jako otázku: „Mohl bys zvážit…?“ nebo „Co si myslíš o možnosti…?“',
      'Otázka dává druhému prostor a snižuje odpor vůči návrhu.',

      // Day 7
      'Dnes si připrav 5 otázek pro jeden konkrétní rozhovor, které povedou k požadovanému závěru.',
      'Dobře připravené otázky často fungují lépe než dlouhé argumenty.',

      // Day 8
      'Dnes místo přímého „ne“ polož otázku typu: „Jak by to fungovalo, kdyby…?“',
      'Otázka místo negace drží dialog otevřený a méně konfliktní.',

      // Day 9
      'Dnes sleduj, kdy sám říkáš „ne“, a zda odmítáš myšlenku nebo jen způsob podání.',
      'Lidé často odmítají způsob, jakým je návrh předložen, ne samotnou myšlenku.',

      // Day 10
      'Dnes vědomě použij sérii „ano“ otázek v jednom důležitém rozhovoru a zapiš výsledek.',
      'Přimět druhého k přirozenému souhlasu vyžaduje přípravu, pokoru a disciplínu.',
    ],
    tips: [
      'Připrav si otázky dřív, než začneš přesvědčovat.',
      'Nahrazuj „ale“ spojkami, které vytvářejí most.',
      'Veď druhého otázkami, ne tlakem.',
      'Začínej tam, kde se shodujete.',
      'Souhlas na začátku otevírá prostor.',
      'Formuluj návrhy jako otázky.',
      'Pět dobrých otázek je silnějších než jeden dlouhý argument.',
      'Místo negace zkus zvědavou otázku.',
      'Uč se ze svého vlastního odporu.',
      'Sokratova metoda se zlepšuje praxí.',
    ],
  ),
  AppTask(
    id: 'pochval-kazde-zlepseni',
    name: 'Pochval každé zlepšení',
    description:
        'Nauč se všímat si drobného pokroku u druhých a posilovat ho konkrétním uznáním.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si všímej drobných pokroků u lidí kolem sebe. Alespoň jeden pojmenuj nahlas.',
      'Pochvala může uspět tam, kde kritika selhává – zvlášť když si někdo všimne konkrétního zlepšení.',

      // Day 2
      'Dnes pochval progres, ne výsledek. Zaměř se na změnu v přístupu, snaze nebo postupu.',
      'Carol Dweck ukázala, že pochvala za snahu a pokrok podporuje růstové nastavení mysli.',

      // Day 3
      'Dnes najdi malý pokrok u člověka, který působí frustrovaně nebo zaseknutě.',
      'I malý pokrok může být pro druhého důkazem, že se posouvá.',

      // Day 4
      'Dnes si po každé pochvale zaznamenej reakci druhého.',
      'Reakce na pochvalu ti ukáže, jak silně může uznání změnit náladu i chování.',

      // Day 5
      'Dnes pochval dítě nebo mladšího člověka konkrétně za snahu.',
      'Pochvala za snahu buduje odolnost lépe než pochvala za talent nebo inteligenci.',

      // Day 6
      'Dnes pochval bez záminky, bez očekávání a bez snahy něco získat.',
      'Čisté uznání pomáhá člověku přijmout lepší obraz sebe sama.',

      // Day 7
      'Dnes navrhni v týmu nebo rodině sdílení drobných výher.',
      'Příjemná atmosféra vzniká z malých každodenních uznání, ne jen z velkých gest.',

      // Day 8
      'Dnes si všímej cesty, ne výsledku. Koho vidíš snažit se, i když výsledek ještě nepřišel?',
      'Cestu lze ocenit vždy – i tehdy, když výsledek zatím není dokonalý.',

      // Day 9
      'Dnes si napiš 3 lidi, kteří tebe někdy povzbudili za pokrok.',
      'Povzbuzení je pro člověka silným zdrojem energie a motivace.',

      // Day 10
      'Dnes si vytvoř plán: koho budeš pravidelně povzbuzovat za pokrok a jak často.',
      'Když lidem dáš dobré jméno, často se mu chtějí přiblížit.',
    ],
    tips: [
      'Dnes hledej drobný pokrok, ne dokonalost.',
      'Chval přístup a snahu víc než výsledek.',
      'Stagnace může skrývat neviditelný pokrok.',
      'Sleduj reakce lidí na tvoji pochvalu.',
      'U dětí chval hlavně úsilí.',
      'Pochvala má být dar, ne taktika.',
      'Sdílení malých výher mění atmosféru.',
      'Cestu lze ocenit i bez hotového výsledku.',
      'Vzpomínka na vlastní povzbuzení tě naučí povzbuzovat druhé.',
      'Naplánuj si pravidelné uznání jako vztahový návyk.',
    ],
  ),
  AppTask(
    id: 'vzij-se-do-pohledu-druheho',
    name: 'Vžij se do pohledu druhého',
    description:
        'Nauč se chápat situace očima druhých, snižovat napětí a vést rozhovory s větší empatií.',
    durationMinutes: 0,
    totalDays: 14,
    dailyFacts: [
      // Day 1
      'Dnes si při první neshodě před odpovědí polož otázku: „Z jakých zkušeností nebo hodnot druhý vychází?“',
      'Henry Ford říkal, že tajemství úspěchu spočívá ve schopnosti vidět věci z hlediska druhého i svého.',

      // Day 2
      'Dnes v jednom rozhovoru řekni: „Na tvém místě bych to pravděpodobně viděl stejně.“',
      'Upřímné uznání pohledu druhého dokáže rychle snížit odpor a změnit atmosféru.',

      // Day 3
      'Dnes si vyber člověka, jehož pohled ti přijde nepochopitelný, a věnuj 5 minut snaze ho pochopit.',
      'Porozumění není totéž co souhlas. Je to samostatný krok nutný pro dialog.',

      // Day 4
      'Dnes v jedné situaci ztiš vlastní hlas a hledej logiku pohledu druhého.',
      'Skutečná empatie funguje jen tehdy, když není pouhou taktikou.',

      // Day 5
      'Dnes napiš pohled druhého vlastními slovy tak, jak by ho možná popsal on.',
      'Písemné vyjádření pohledu druhého je silný test skutečného porozumění.',

      // Day 6
      'Dnes při obtížném rozhovoru použij zrcadlení: „Takže říkáš, že…“',
      'Lidé jsou ochotnější spolupracovat, když cítí, že jim druhý opravdu rozumí.',

      // Day 7
      'Dnes si všimni jednoho rychlého soudu, který máš o konkrétním člověku, a zpochybni ho.',
      'Předsudek je rychlý soud. Jeho zpochybnění otevírá prostor pro porozumění.',

      // Day 8
      'Dnes si před důležitou schůzkou napiš: „Co si druhý přeje a čeho se obává?“',
      'Přání a obavy druhého jsou mapa pro celý rozhovor.',

      // Day 9
      'Dnes při neshodě zkus na chvíli obhájit pohled druhého, i když s ním nesouhlasíš.',
      'Bránit pohled druhého je jeden z nejrychlejších způsobů, jak ho skutečně pochopit.',

      // Day 10
      'Dnes věnuj 10 minut situaci z minulosti, kde jsi nepochopil pohled druhého.',
      'Když pochopíme okolnosti a pohled druhého, snáze opustíme zbytečné soudy.',

      // Day 11
      'Dnes potlač snahu druhého opravovat. Jen naslouchej a hledej, proč věc vidí právě tak.',
      'Lidé se svých názorů drží i proto, že jsou součástí jejich sebeúcty.',

      // Day 12
      'Dnes se někoho zeptej na jeho největší aktuální výzvu a jen naslouchej.',
      'Pocit, že jsme pochopeni, je sám o sobě velmi silný a léčivý.',

      // Day 13
      'Dnes si napiš, v čem jsou tví nejbližší jiní než ty – hodnotami, potřebami nebo způsobem myšlení.',
      'Empatie začíná přijetím, že lidé jsou tvarováni jinými okolnostmi než my.',

      // Day 14
      'Dnes si napiš 3 situace z posledních 14 dní, kde jsi vědomě pochopil pohled druhého.',
      'Snaha pochopit druhého z nás dělá lidi, se kterými se ostatní cítí bezpečněji.',
    ],
    tips: [
      'Před odpovědí zkus nejdřív pojmenovat pohled druhého.',
      'Empatická věta často odzbrojí odpor.',
      'Porozumět neznamená souhlasit.',
      'Naslouchej logice druhého, ne jen vlastním argumentům.',
      'Piš pohled druhého jeho očima.',
      'Zrcadlení ověřuje, že skutečně slyšíš.',
      'Zpochybňuj rychlé soudy.',
      'Přání a obavy druhého jsou klíč k rozhovoru.',
      'Zkus obhájit i názor, se kterým nesouhlasíš.',
      'Minulé chyby ber jako data, ne jako důvod k vině.',
      'Neopravuj hned – nejdřív pochop.',
      'Pocit pochopení je dar.',
      'Nejbližší vztahy jsou nejlepší trénink empatie.',
      'Empatie je dlouhodobá praxe.',
    ],
  ),
  AppTask(
    id: 'nech-druheho-zachovat-tvar',
    name: 'Nech druhého zachovat tvář',
    description:
        'Nauč se opravovat, odmítat a vést druhé tak, aby si zachovali důstojnost.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes si všímej situací, kde by přímé odmítnutí nebo oprava mohly druhého ponížit. Hledej jemnější cestu.',
      'Saint-Exupéry zdůrazňoval, že nemáme právo druhého snižovat v jeho vlastních očích.',

      // Day 2
      'Dnes při opravování chyby začni tím, co bylo dobré. Opravu řeš soukromě, pokud je to možné.',
      'Soukromá oprava chrání důstojnost a snižuje odpor.',

      // Day 3
      'Dnes místo přímého odmítnutí nápadu řekni: „To je zajímavá myšlenka. Co kdybychom tady…“',
      'Uznání nápadu pomáhá druhému změnit směr bez pocitu porážky.',

      // Day 4
      'Dnes při neshodě formuluj závěr tak, aby druhý mohl souhlasit důstojně.',
      'Zachování tváře je důležité v každé kultuře i v každé dlouhodobé spolupráci.',

      // Day 5
      'Dnes formuluj opravy a úkoly jako možnosti, ne příkazy.',
      'Návrh respektuje autonomii, zatímco příkaz často vyvolává odpor.',

      // Day 6
      'Dnes před opravou druhého nejprve přiznej vlastní podobnou chybu.',
      'Kritika se přijímá snáze, když kritik ukáže, že také není dokonalý.',

      // Day 7
      'Dnes si připomeň situaci, kdy jsi někoho ponížil, a promysli, jak by šla zvládnout lépe.',
      'Skutečný charakter se pozná podle toho, jak chráníme důstojnost druhých.',

      // Day 8
      'Dnes v obtížném rozhovoru hledej formulaci, která umožní druhému změnit názor bez pocitu prohry.',
      'Když člověk může změnit pohled důstojně, snáze se stává spojencem.',

      // Day 9
      'Dnes si po rozhovorech polož otázku: „Odešel druhý se vztyčenou hlavou?“',
      'Lidé si často pamatují hlavně to, jak se po rozhovoru cítili.',

      // Day 10
      'Dnes si napiš 3 situace, kde jsi druhému pomohl zachovat tvář.',
      'Kdo druhému pomůže zachovat důstojnost, často získá dlouhodobou důvěru.',
    ],
    tips: [
      'Všímej si, kdy je ohrožena důstojnost druhého.',
      'Opravuj soukromě, chval veřejně.',
      'Uznání nápadu není totéž co souhlas.',
      'Nech druhého souhlasit bez pocitu porážky.',
      'Používej návrhy místo příkazů.',
      'Před kritikou přiznej vlastní slabost.',
      'Retrospektiva pomáhá změnit vzorce.',
      'Hledej formulace, které chrání hrdost druhého.',
      'Ptej se, jak se druhý po rozhovoru cítil.',
      'Zachování tváře je základ dlouhodobé spolupráce.',
    ],
  ),
  AppTask(
    id: 'dej-druhemu-pocit-ze-je-to-jeho-napad',
    name: 'Dej druhému pocit, že je to jeho nápad',
    description:
        'Nauč se vést druhé k závěrům tak, aby měli pocit vlastnictví a odpovědnosti.',
    durationMinutes: 0,
    totalDays: 10,
    dailyFacts: [
      // Day 1
      'Dnes místo přímého prosazení nápadu veď rozhovor otázkami, aby druhý sám došel k podobnému závěru.',
      'Galileo říkal, že člověka nelze něčemu naučit – lze mu jen pomoci, aby to v sobě objevil.',

      // Day 2
      'Dnes sdílej myšlenku jako zárodek: „Přemýšlím o tom, ale nejsem si jistý… co myslíš?“',
      'Když druhý myšlenku rozvine, začne ji vnímat jako částečně vlastní.',

      // Day 3
      'Dnes použij frázi: „Co si myslíš, mohl by fungovat tento přístup?“ místo „Navrhuji tento přístup.“',
      'Otázka přenáší autorství a zvyšuje ochotu nést odpovědnost.',

      // Day 4
      'Dnes zkus techniku „zárodek + ticho“. Naznač myšlenku a mlč.',
      'Ticho dává druhému prostor doplnit myšlenku vlastním způsobem.',

      // Day 5
      'Dnes si všimni, jak moc lpíš na autorství svého nápadu.',
      'Ego chce uznání za nápad. Výsledek potřebuje, aby byl nápad přijat.',

      // Day 6
      'Dnes veď konverzaci tak, aby druhý došel k závěru bez tvého přímého prosazování.',
      'Lidé jsou zodpovědnější za myšlenky, které považují za vlastní.',

      // Day 7
      'Dnes formuluj návrh nebo zpětnou vazbu jako otázku: „Co myslíš, mohlo by to fungovat lépe takto?“',
      'Otázka místo rady respektuje autonomii druhého.',

      // Day 8
      'Dnes v týmu vytvářej prostor, aby byly nápady vnímány jako společné.',
      'Vliv často nevzniká prosazováním, ale vytvářením prostoru pro myšlenky druhých.',

      // Day 9
      'Dnes si zapiš situaci, kde jsi nápad prosadil přímo, a jaká byla angažovanost druhého.',
      'Vnucené myšlenky bývají realizovány s menší energií než ty, které lidé považují za své.',

      // Day 10
      'Dnes vědomě použij princip „jeho nápad“ v jedné situaci a zapiš výsledek.',
      'Nejlepší přesvědčovatelé neprosazují silou. Vedou druhé k vlastním závěrům.',
    ],
    tips: [
      'Zaměř se na výsledek, ne na autorství.',
      'Sdílej myšlenky jako zárodky.',
      'Otázka vytváří spoluvlastnictví.',
      'Po naznačení myšlenky nech prostor tichu.',
      'Sleduj vlastní ego.',
      'Nech druhého dojít k závěru.',
      'Nahrazuj rady otázkami.',
      'Buduj skupinové vlastnictví nápadů.',
      'Uč se z vlastních zkušeností s odporem.',
      'Princip „jeho nápad“ vyžaduje praxi.',
    ],
  ),
];
