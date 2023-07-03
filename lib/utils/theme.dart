/*
File: theme.dart
Description: Defines ThemeData for the rest of the app, with a utility class
Author: Garv Shah
Created: Sat Jun 18 18:29:00 2022
Doc Link: https://github.com/garv-shah/aporia-network#theme-data
 */

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:aporia_app/utils/plugins/actions/block_action_list.dart';
import 'package:aporia_app/utils/plugins/actions/option_action.dart';
import 'package:aporia_app/utils/plugins/math_equation/math_equation_block_component.dart';
import 'package:flowy_infra/theme_extension.dart';
import 'package:flowy_infra/colorscheme/colorscheme.dart';
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

TextStyle _getFontStyle({
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  Color? fontColor,
  double? letterSpacing,
  double? lineHeight,
}) =>
    TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? 12,
      color: fontColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamilyFallback: const ["Noto Color Emoji"],
      letterSpacing: (fontSize ?? 12) * (letterSpacing ?? 0.005),
      height: lineHeight,
    );

class AppThemes {
  /// light mode theme
  static FlowyColorScheme flowyLight = FlowyColorScheme.builtIn('Default', Brightness.light);
  static FlowyColorScheme flowyDark = FlowyColorScheme.builtIn('Default', Brightness.dark);


  static ThemeData lightTheme = ThemeData(
      primaryColorLight: Colors.black,
      primaryColor: const Color(0xfffcfcff),
      scaffoldBackgroundColor: const Color(0xfffcfcff),
      canvasColor: const Color(0xfffcfcff),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white
      ),
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple.shade100,
        elevation: 4,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      textTheme:
          const TextTheme(
              labelLarge: TextStyle(color: Colors.deepPurpleAccent),
            bodyMedium: TextStyle(color: Colors.black)
          ),
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
        side: const BorderSide(color: Color(0xff585858)),
      ), colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.deepPurpleAccent.shade200,
          tertiaryContainer: Colors.deepPurpleAccent.shade100.withAlpha(60),
          brightness: Brightness.light).copyWith(background: const Color(0xfffcfcff)),
    extensions: [
      AFThemeExtension(
        warning: const Color(0xffffd667),
        success: const Color(0xff66cf80),
        tint1: const Color(0xffe8e0ff),
        tint2: const Color(0xffffe7fd),
        tint3: const Color(0xffffe7ee),
        tint4: const Color(0xffffefe3),
        tint5: const Color(0xfffff2cd),
        tint6: const Color(0xfff5ffdc),
        tint7: const Color(0xffddffd6),
        tint8: const Color(0xffdefff1),
        tint9: const Color(0xffe1fbff),
        textColor: const Color(0xff333333),
        greyHover: const Color(0xffedeef2),
        greySelect: const Color(0xffe2e4eb),
        lightGreyHover: const Color(0xfff2f2f2),
        toggleOffFill: const Color(0xffe0e0e0),
        progressBarBGColor: const Color(0xffe1fbff),
        toggleButtonBGColor: const Color(0xffe0e0e0),
        code: _getFontStyle(
          fontColor: const Color(0xff828282),
        ),
        callout: _getFontStyle(
          fontSize: 11,
          fontColor: const Color(0xff828282),
        ),
        caption: _getFontStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          fontColor: const Color(0xff828282),
        ),
      ),
    ]
  );

  /// dark mode theme
  static ThemeData darkTheme = ThemeData(
    primaryColorLight: const Color(0xfffcfcff),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xff12162B),
    canvasColor: const Color(0xff12162B),
    cardColor: const Color(0xff1F2547),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white
      ),
    appBarTheme: const AppBarTheme(
      color: Color(0xff1F2547),
      elevation: 4,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
    textTheme: const TextTheme(labelLarge: TextStyle(color: Colors.indigoAccent)),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white38),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white38),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.indigoAccent),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.indigoAccent),
        side: const BorderSide(color: Color(0xff585858)),
      ), colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.indigoAccent,
        secondary: Colors.indigo,
        tertiaryContainer: Colors.indigoAccent.shade100.withAlpha(60),
        brightness: Brightness.dark).copyWith(background: Colors.black),
      extensions: [
        AFThemeExtension(
          warning: const Color(0xffF7CF46),
          success: const Color(0xff66CF80),
          tint1: const Color(0xff8738F5),
          tint2: const Color(0xffE6336E),
          tint3: const Color(0xffFF2D9E),
          tint4: const Color(0xffE9973E),
          tint5: const Color(0xffFBF000),
          tint6: const Color(0xffC0F000),
          tint7: const Color(0xff15F74E),
          tint8: const Color(0xff00F0E2),
          tint9: const Color(0xff00BCF0),
          textColor: const Color(0xffBBC3CD),
          greyHover: const Color(0xff00BCF0), // dark main
          greySelect: const Color(0xff00BCF0),
          lightGreyHover: const Color(0xff363D49),
          toggleOffFill: const Color(0xffBBC3CD),
          progressBarBGColor: const Color(0xff363D49),
          toggleButtonBGColor: const Color(0xffe0e0e0),
          code: _getFontStyle(
            fontColor: const Color(0xff363D49),
          ),
          callout: _getFontStyle(
            fontSize: 11,
            fontColor: const Color(0xff363D49),
          ),
          caption: _getFontStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontColor: const Color(0xffBBC3CD),
          ),
        ),
      ]
  );
}

List<CharacterShortcutEvent> getCustomCharacterShortcutEvents(BuildContext context) {
  return [
    // '\n'
    insertNewLineAfterBulletedList,
    insertNewLineAfterTodoList,
    insertNewLineAfterNumberedList,
    insertNewLine,

    // bulleted list
    formatAsteriskToBulletedList,
    formatMinusToBulletedList,

    // numbered list
    formatNumberToNumberedList,

    // quote
    formatDoubleQuoteToQuote,

    // heading
    formatSignToHeading,

    // checkbox
    // format unchecked box, [] or -[]
    formatEmptyBracketsToUncheckedBox,
    formatHyphenEmptyBracketsToUncheckedBox,

    // format checked box, [x] or -[x]
    formatFilledBracketsToCheckedBox,
    formatHyphenFilledBracketsToCheckedBox,

    // slash
    slashMenu(context),

    // divider
    convertMinusesToDivider,
    convertStarsToDivider,
    convertUnderscoreToDivider,

    // markdown syntax
    ...markdownSyntaxShortcutEvents,
  ];
}

Map<String, BlockComponentBuilder> getCustomBlockComponentBuilderMap(BuildContext buildContext, EditorState editorState) {
  final standardActions = [
    OptionAction.delete,
    OptionAction.duplicate,
    // OptionAction.divider,
    // OptionAction.moveUp,
    // OptionAction.moveDown,
  ];

  final configuration = BlockComponentConfiguration(
    padding: (_) => const EdgeInsets.symmetric(vertical: 5.0),
  );
  final Map<String, BlockComponentBuilder> customBlockComponentBuilderMap = {
    PageBlockKeys.type: PageBlockComponentBuilder(),
    ParagraphBlockKeys.type: TextBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration,
    ),
    TodoListBlockKeys.type: TodoListBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => 'To-do',
      ),
    ),
    BulletedListBlockKeys.type: BulletedListBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => 'List',
      ),
    ),
    NumberedListBlockKeys.type: NumberedListBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => 'List',
      ),
    ),
    QuoteBlockKeys.type: QuoteBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (_) => 'Quote',
      ),
    ),
    HeadingBlockKeys.type: HeadingBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        placeholderText: (node) =>
        'Heading ${node.attributes[HeadingBlockKeys.level]}',
      ),
    ),
    ImageBlockKeys.type: ImageBlockComponentBuilder(),
    DividerBlockKeys.type: DividerBlockComponentBuilder(
      configuration: standardBlockComponentConfiguration.copyWith(
        padding: (node) => const EdgeInsets.symmetric(vertical: 8.0),
      ),
    ),
    MathEquationBlockKeys.type: MathEquationBlockComponentBuilder(
      configuration: configuration.copyWith(
        padding: (_) => const EdgeInsets.symmetric(vertical: 20),
      ),
    ),
  };

  final builders = {
    ...standardBlockComponentBuilderMap,
    ...customBlockComponentBuilderMap,
  };

  // customize the action builder. actually, we can customize them in their own builder. Put them here just for convenience.
  for (final entry in builders.entries) {
    if (entry.key == PageBlockKeys.type) {
      continue;
    }
    final builder = entry.value;

    // customize the action builder.
    final supportColorBuilderTypes = [
      ParagraphBlockKeys.type,
      HeadingBlockKeys.type,
      BulletedListBlockKeys.type,
      NumberedListBlockKeys.type,
      QuoteBlockKeys.type,
      TodoListBlockKeys.type,
      // CalloutBlockKeys.type
    ];

    final supportAlignBuilderType = [
      ImageBlockKeys.type,
    ];

    final colorAction = [
      OptionAction.divider,
      OptionAction.color,
    ];

    final alignAction = [
      OptionAction.divider,
      OptionAction.align,
    ];

    final List<OptionAction> actions = [
      ...standardActions,
      if (supportColorBuilderTypes.contains(entry.key)) ...colorAction,
      if (supportAlignBuilderType.contains(entry.key)) ...alignAction,
    ];

    builder.showActions = (_) => true;
    builder.actionBuilder = (context, state) {
      final padding = context.node.type == HeadingBlockKeys.type
          ? const EdgeInsets.only(top: 8.0)
          : const EdgeInsets.all(0);
      return Padding(
        padding: padding,
        child: BlockActionList(
          blockComponentContext: context,
          blockComponentState: state,
          editorState: editorState,
          actions: actions,
          showSlashMenu: () => slashMenu(buildContext).handler,
        ),
      );
    };
  }

  return builders;
}

CharacterShortcutEvent slashMenu(BuildContext parentContext) {
  return customSlashCommand([
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.text,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'text',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['text'],
      handler: (editorState, _, __) {
        insertNodeAfterSelection(editorState, paragraphNode());
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.heading1,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'h1',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['heading 1, h1'],
      handler: (editorState, _, __) {
        insertHeadingAfterSelection(editorState, 1);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.heading2,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'h2',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['heading 2, h2'],
      handler: (editorState, _, __) {
        insertHeadingAfterSelection(editorState, 2);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.heading3,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'h3',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['heading 3, h3'],
      handler: (editorState, _, __) {
        insertHeadingAfterSelection(editorState, 3);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.image,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'image',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['image'],
      handler: (editorState, menuService, context) {
        final container = Overlay.of(context);
        showImageMenu(container, editorState, menuService,
            onInsertImage: (imageUrl) async {
              http.Response res;
              try {
                res = await http.get(Uri.parse(imageUrl));
                // if status code of remote image is 200, then insert it!
                if (res.statusCode == 200) editorState.insertImageNode(imageUrl);
              } catch (e) {
                // image is most likely a local file
                print(imageUrl);
                File file = File(imageUrl);
                String? remoteUrl = await uploadFile(file.readAsBytesSync(), basename(imageUrl), extension(imageUrl), parentContext);
                if (remoteUrl != null) editorState.insertImageNode(remoteUrl);
              }
            }
        );
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.bulletedList,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'bulleted_list',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['bulleted list', 'list', 'unordered list'],
      handler: (editorState, _, __) {
        insertBulletedListAfterSelection(editorState);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.numberedList,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'number',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['numbered list', 'list', 'ordered list'],
      handler: (editorState, _, __) {
        insertNumberedListAfterSelection(editorState);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.checkbox,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'checkbox',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['todo list', 'list', 'checkbox list'],
      handler: (editorState, _, __) {
        insertCheckboxAfterSelection(editorState);
      },
    ),
    SelectionMenuItem(
      name: AppFlowyEditorLocalizations.current.quote,
      icon: (editorState, isSelected, style) => SelectionMenuIconWidget(
        name: 'quote',
        isSelected: isSelected,
        style: style,
      ),
      keywords: ['quote', 'refer'],
      handler: (editorState, _, __) {
        insertQuoteAfterSelection(editorState);
      },
    ),
    dividerMenuItem,
    mathEquationItem
  ],
      style: SelectionMenuStyle(
          selectionMenuBackgroundColor: Theme.of(parentContext).cardColor,
          selectionMenuItemTextColor: Theme.of(parentContext).primaryColorLight,
          selectionMenuItemIconColor: Theme.of(parentContext).primaryColorLight,
          selectionMenuItemSelectedTextColor: Theme.of(parentContext).colorScheme.primary,
          selectionMenuItemSelectedIconColor: Theme.of(parentContext).colorScheme.primary,
          selectionMenuItemSelectedColor: Theme.of(parentContext).colorScheme.primary.withAlpha(45))
  );
}

// Uploads files to Firebase and returns the download url
Future<String?> uploadFile(Uint8List file, String name, String fileExtension, BuildContext context) async {
  // Check if the file is too large
  int size = file.lengthInBytes;
  // Checks if the file is above 10mb
  bool tooBig = size > 10000000;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        tooBig ? "Files cannot be larger than 10mb!" : "Uploading file!",
        style: TextStyle(
            color:
            Theme.of(context).primaryColorLight),
      ),
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,
    ),
  );

  if (!tooBig) {
    // Storage instance.
    final storage = FirebaseStorage.instance;

    // Sets the storage path to a folder of the user's UID inside the
    // userMedia folder, followed by the file type detected by Mime.
    // For example, if I uploaded a png, it would be
    // userMedia/123456789/image-123456789.png
    Reference ref = storage.ref(
        'userMedia/${FirebaseAuth.instance.currentUser
            ?.uid}/$name-${const Uuid().v4()}$fileExtension');

    // Creates a metadata object from the raw bytes of the image,
    // and then sets it to the reference above
    SettableMetadata metadata =
    SettableMetadata(contentType: lookupMimeType('', headerBytes: file));

    await ref.putData(file, metadata);

    // Gets the URL of this newly created object
    var downloadUrl = ref.getDownloadURL();

    return downloadUrl;
  } else {
    return null;
  }
}
