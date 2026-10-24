Table quiz_data;

void loadQuizData() {
    quiz_data = loadTable("quiz.csv", "header");
    boolean has_completed_column = false;
    for (String column_title : quiz_data.getColumnTitles()) {
        if (column_title.equals("正解済")) {
            has_completed_column = true;
            break;
        }
    }
    if (!has_completed_column) {
        quiz_data.addColumn("正解済");
        for (TableRow quiz_row : quiz_data.rows()) {
            quiz_row.setString("正解済", "False");
        }
        saveTable(quiz_data, "quiz.csv");
    }
    println("クイズを読み込みました: " + quiz_data.getRowCount() + "問");
}

void quiz() {
    if (quiz_data == null || quiz_data.getRowCount() == 0) {
        return;
    }
    
    if (!selectNextQuiz()) {
        fill(0);
        textSize(32);
        text("全問正解", 40, 180);
        textSize(24);
        text("E:退出", 40, 460);
        return;
    }
    
    TableRow current_quiz = quiz_data.getRow(mode_num);
    
    fill(0);
    textSize(28);
    text("Q" + current_quiz.getInt("問題番号") + " " + current_quiz.getString("問題"), 40, 80);
    
    textSize(24);
    for (int choice_num = 1; choice_num <= 4; choice_num++) {
        String choice = current_quiz.getString("選択肢" + choice_num);
        text(choice_num + ". " + choice, 80, 140 + (choice_num - 1) * 55);
    }
    
    text("正解済: " + current_quiz.getString("正解済"), 40, 390);
    text("1〜4キーで回答", 40, 430);
    text("E:退出", 40, 460);
}

void answerQuiz(int answer) {
    if (quiz_data == null || quiz_data.getRowCount() == 0) {
        return;
    }
    
    if (!selectNextQuiz()) {
        return;
    }
    
    TableRow current_quiz = quiz_data.getRow(mode_num);
    boolean is_correct = answer == current_quiz.getInt("答え");
    current_quiz.setString("正解済", is_correct ? "True" : "False");
    saveTable(quiz_data, "quiz.csv");
}

boolean selectNextQuiz() {
    for (int quiz_num = 0; quiz_num < quiz_data.getRowCount(); quiz_num++) {
        TableRow quiz_row = quiz_data.getRow(quiz_num);
        if (!quiz_row.getString("正解済").equalsIgnoreCase("True")) {
            mode_num = quiz_num;
            return true;
        }
    }
    return false;
}