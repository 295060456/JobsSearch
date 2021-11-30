//
//  NSString+FilteringSpecialCharacters.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+FilteringSpecialCharacters.h"

/*
 * 常用符号大全
 * 特殊符号 编号序号 数学符号 爱心符号 标点符号 单位符号 货币符号 箭头符号 符号图案 制表符 皇冠符号
 * 汉语拼音 中文字符 日语字符 希腊字母 俄语字母
 */

NSString *const 皇冠符号 = @"♚　♛　♝　♞　♜　♟　♔　♕　♗　♘　♖　♟";
NSString *const 数学符号 = @" ﹢﹣×÷±/=≌∽≦≧≒﹤﹥≈≡≠=≤≥<>≮≯∷∶∫∮∝∞∧∨∑∏∪∩∈∵∴⊥∥∠⌒⊙√∟⊿㏒㏑%‰⅟½⅓⅕⅙⅛⅔⅖⅚⅜¾⅗⅝⅞⅘≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩⊰⊱⋛⋚∫∬∭∮∯∰∱∲∳%℅‰‱øØπ";
NSString *const 标点符号 = @"。，、＇：∶；?‘’“”〝〞ˆˇ﹕︰﹔﹖﹑·¨….¸;！´？！～—ˉ｜‖＂〃｀@﹫¡¿﹏﹋﹌︴々﹟#﹩$﹠&﹪%*﹡﹢﹦﹤‐￣¯―﹨ˆ˜﹍﹎+=<＿_-ˇ~﹉﹊（）〈〉‹›﹛﹜『』〖〗［］《》〔〕{}「」【】︵︷︿︹︽_﹁﹃︻︶︸﹀︺︾ˉ﹂﹄︼❝❞!():,'[]｛｝^・.·．•＃＾＊＋＝＼＜＞＆§⋯`－–／—|\"\\";
NSString *const 单位符号 = @"°′″＄￥〒￠￡％＠℃℉﹩﹪‰﹫㎡㏕㎜㎝㎞㏎m³㎎㎏㏄º○¤%$º¹²³";
NSString *const 货币符号 = @"₽€£Ұ₴$₰¢₤¥₳₲₪₵元₣₱฿¤₡₮₭₩ރ円₢₥₫₦zł﷼₠₧₯₨Kčर₹ƒ₸￠";
NSString *const 制表符 = @"─ ━│┃╌╍╎╏┄ ┅┆┇┈ ┉┊┋┌┍┎┏┐┑┒┓└ ┕┖┗ ┘┙┚┛├┝┞┟┠┡┢┣ ┤┥┦┧┨┩┪┫┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╪ ╫ ╬═║╒╓╔ ╕╖╗╘╙╚ ╛╜╝╞╟╠ ╡╢╣╤ ╥ ╦ ╧ ╨ ╩ ╳╔ ╗╝╚ ╬ ═ ╓ ╩ ┠ ┨┯ ┷┏ ┓┗ ┛┳ ⊥ ﹃ ﹄┌ ╮ ╭ ╯╰";
NSString *const 特殊符号 = @"♠♣♧♡♥❤❥❣♂♀✲☀☼☾☽◐◑☺☻☎☏✿❀№↑↓←→√×÷★℃℉°◆◇⊙■□△▽¿½☯✡㍿卍卐♂♀✚〓㎡♪♫♩♬㊚㊛囍㊒㊖Φ♀♂‖$@*&#※卍卐Ψ♫♬♭♩♪♯♮⌒¶∮‖€￡¥$";
NSString *const 编号序号 = @"①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳⓪❶❷❸❹❺❻❼❽❾❿⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴㊀㊁㊂㊃㊄㊅㊆㊇㊈㊉㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵";
NSString *const 爱心符号 = @"♥❣ღ♠♡♤❤❥";
NSString *const 箭头符号 = @"↑↓←→↖↗↘↙↔↕➻➼➽➸➳➺➻➴➵➶➷➹▶►▷◁◀◄«»➩➪➫➬➭➮➯➱⏎➲➾➔➘➙➚➛➜➝➞➟➠➡➢➣➤➥➦➧➨↚↛↜↝↞↟↠↠↡↢↣↤↤↥↦↧↨⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇖⇗⇘⇙⇜↩↪↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹☇☈↼↽↾↿⇀⇁⇂⇃⇞⇟⇠⇡⇢⇣⇤⇥⇦⇧⇨⇩⇪↺↻⇚⇛♐";
NSString *const 符号图案 = @"✐✎✏✑✒✍✉✁✂✃✄✆✉☎☏☑✓✔√☐☒✗✘ㄨ✕✖✖☢☠☣✈★☆✡囍㍿☯☰☲☱☴☵☶☳☷☜☞☝✍☚☛☟✌♤♧♡♢♠♣♥♦☀☁☂❄☃♨웃유❖☽☾☪✿♂♀✪✯☭➳卍卐√×■◆●○◐◑✙☺☻❀⚘♔♕♖♗♘♙♚♛♜♝♞♟♧♡♂♀♠♣♥❤☜☞☎☏⊙◎☺☻☼▧▨♨◐◑↔↕▪▒◊◦▣▤▥▦▩◘◈◇♬♪♩♭♪の★☆→あぃ￡Ю〓§♤♥▶¤✲❈✿✲❈➹☀☂☁【】┱┲❣✚✪✣✤✥✦❉❥❦❧❃❂❁❀✄☪☣☢☠☭ღ▶▷◀◁☀☁☂☃☄★☆☇☈⊙☊☋☌☍ⓛⓞⓥⓔ╬『』∴☀♫♬♩♭♪☆∷﹌の★◎▶☺☻►◄▧▨♨◐◑↔↕↘▀▄█▌◦☼♪の☆→♧ぃ￡❤▒▬♦◊◦♠♣▣۰•❤•۰►◄▧▨♨◐◑↔↕▪▫☼♦⊙●○①⊕◎Θ⊙¤㊣★☆♀◆◇◣◢◥▲▼△▽⊿◤◥✐✌✍✡✓✔✕✖♂♀♥♡☜☞☎☏⊙◎☺☻►◄▧▨♨◐◑↔↕♥♡▪▫☼♦▀▄█▌▐░▒▬♦◊◘◙◦☼♠♣▣▤▥▦▩◘◙◈♫♬♪♩♭♪✄☪☣☢☠♯♩♪♫♬♭♮☎☏☪♈ºº₪¤큐«»™♂✿♥　◕‿-｡　｡◕‿◕｡";
#pragma mark —— 语言文字类型
NSString *const 希腊字母 = @"ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζνξοπρσηθικλμτυφχψω";
NSString *const 俄语字母 = @"АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя";
NSString *const 汉语拼音 = @"āáǎàōóǒòēéěèīíǐìūúǔùǖǘǚǜüêɑńňɡㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦㄧㄨㄩ";
NSString *const 中文字符 = @"零壹贰叁肆伍陆柒捌玖拾佰仟万亿吉太拍艾分厘毫微卍卐卄巜弍弎弐朤氺曱甴囍兀々〆のぁ〡〢〣〤〥〦〧〨〩㊎㊍㊌㊋㊏㊚㊛㊐㊊㊣㊤㊥㊦㊧㊨㊒㊫㊑㊓㊔㊕㊖㊗㊘㊜㊝㊞㊟㊠㊡㊢㊩㊪㊬㊭㊮㊯㊰㊀㊁㊂㊃㊄㊅㊆㊇㊈㊉";
NSString *const 日文平假名和片假名 = @"ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんゔゕゖァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺ・ーヽヾヿ゠ㇰㇱㇲㇳㇴㇵㇶㇷㇸㇹㇺㇻㇼㇽㇾㇿ";

@implementation NSString (FilteringSpecialCharacters)

/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
/// @param specialSymbolsStringMutArr 选择的特殊符号数组
-(NSString *)specialSymbolsAction:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr{
    NSString *tempStr = @"";
    for (NSString *specialSymbolsString in specialSymbolsStringMutArr) {
        tempStr = [tempStr stringByAppendingString:specialSymbolsString];
    }return tempStr;
}
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
/// @param specialSymbolsStringMutArr 过滤策略
-(NSString *_Nullable)filtered:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr{
    if (!specialSymbolsStringMutArr) {
        specialSymbolsStringMutArr = NSMutableArray.array;
        [specialSymbolsStringMutArr addObject:皇冠符号];
        [specialSymbolsStringMutArr addObject:数学符号];
        [specialSymbolsStringMutArr addObject:标点符号];
        [specialSymbolsStringMutArr addObject:单位符号];
        [specialSymbolsStringMutArr addObject:货币符号];
        [specialSymbolsStringMutArr addObject:制表符];
        [specialSymbolsStringMutArr addObject:特殊符号];
        [specialSymbolsStringMutArr addObject:编号序号];
        [specialSymbolsStringMutArr addObject:爱心符号];
        [specialSymbolsStringMutArr addObject:箭头符号];
        [specialSymbolsStringMutArr addObject:符号图案];
    }
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:[self specialSymbolsAction:specialSymbolsStringMutArr]];
    /**
        componentsJoinedByString：将array数组转换为string字符串、构造并返回一个NSString对象，该对象是在数组元素之间插入给定分隔符的结果
        componentsSeparatedByString：将string字符串转换为array数组、通过传入的字符串来对目标字符串进行切割成为数组
     
        componentsSeparatedByCharactersInSet：返回一个数组，其中包含来自接收者的子字符串，这些子字符串已被给定集合中的字符分开
     */
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];//filtered 就是过滤掉特殊符号的字符串。可以输入中文英文
    return filtered;
}
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
/// @param specialSymbolsStringMutArr 过滤策略
-(BOOL)isContainsSpecialSymbolsString:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr{
    if (!specialSymbolsStringMutArr) {
        specialSymbolsStringMutArr = NSMutableArray.array;
        [specialSymbolsStringMutArr addObject:皇冠符号];
        [specialSymbolsStringMutArr addObject:数学符号];
        [specialSymbolsStringMutArr addObject:标点符号];
        [specialSymbolsStringMutArr addObject:单位符号];
        [specialSymbolsStringMutArr addObject:货币符号];
        [specialSymbolsStringMutArr addObject:制表符];
        [specialSymbolsStringMutArr addObject:特殊符号];
        [specialSymbolsStringMutArr addObject:编号序号];
        [specialSymbolsStringMutArr addObject:爱心符号];
        [specialSymbolsStringMutArr addObject:箭头符号];
        [specialSymbolsStringMutArr addObject:符号图案];
    }
    NSString *checkStr = [self specialSymbolsAction:specialSymbolsStringMutArr];
    NSArray <NSString *>*checkArr = [checkStr componentsSeparatedByString:@""]; // 意思是通过“,”来切割字符串
    
    for (NSString *str in checkArr) {
        if ([self containsString:str]) {
            return YES;
        }
    }return NO;
}

@end
