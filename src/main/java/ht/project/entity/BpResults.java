package ht.project.entity;

public enum BpResults {
	LOW("result_3", "저혈압 의심"),
    LOW_RISK("result_3", "저혈압"),
    NORMAL("result_1", "건강"),
    HIGH_RISK("result_2", "고혈압 의심"),
    HIGH("result_2", "고혈압");

    private final String cssClass;
    private final String resultText;

    BpResults(String cssClass) {
        this(cssClass, "");
    }

    BpResults(String cssClass, String resultText) {
        this.cssClass = cssClass;
        this.resultText = resultText;
    }

    public String getCssClass() {
        return cssClass;
    }

    public String getResultText() {
        return resultText;
    }
}
