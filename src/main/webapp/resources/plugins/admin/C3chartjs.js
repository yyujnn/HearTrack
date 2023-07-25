(function(window, document, $, undefined) {
	"use strict";

	$.ajax({
		url: 'getRes',
		dataType: 'json',
		type: 'post',
		success: function(res) {

			var srCnt = 0;
			var afCnt = 0;
			var gsvtCnt = 0;
			var sbCnt = 0;

			// 데이터에서 각 결과값(resCnt)을 추출하여 변수에 저장
			for (var i = 0; i < res.length; i++) {
				var result = res[i].results;
				var resCnt = res[i].resCnt;

				if (result === "sr") {
					srCnt = resCnt;
				} else if (result === "af") {
					afCnt = resCnt;
				} else if (result === "gsvt") {
					gsvtCnt = resCnt;
				} else if (result === "sb") {
					sbCnt = resCnt;
				}
			}

			var anaCnt = srCnt + afCnt + sbCnt;

			// 도넛 차트의 데이터 업데이트
			var chart = c3.generate({
				bindto: "#c3chart_donut",
				data: {
					columns: [
						[`SR`, srCnt],
						[`AF`, afCnt],
						[`SB`, sbCnt],
						[`gsvt`, gsvtCnt],
					],
					type: 'donut',
					onclick: function(d, i) { console.log("onclick", d, i); },
					onmouseover: function(d, i) { console.log("onmouseover", d, i); },
					onmouseout: function(d, i) { console.log("onmouseout", d, i); },
					colors: {
						SR: '#6C96FF',
						AF: '#6756E8',
						SB: '#2E7D32',
						gsvt: '#FF825E',
					}
				}
			});

			var chart = c3.generate({
				bindto: "#c3chart_pie1",
				data: {
					columns: [
						['정상분석', anaCnt / (anaCnt + gsvtCnt)],
						['분류불가', gsvtCnt / (anaCnt + gsvtCnt)]
					],
					type: 'pie',

					colors: {
						정상분석: '#6C96FF',
						분류불가: '#FF825E'


					}
				},
				pie: {
					label: {
						format: function(value, ratio, id) {
							return d3.format('.0%')(value);
						}
					}
				}
			});

		},
		error: function(error) {
			console.log(error);
		}
	});

	$.ajax({
		url: 'getDeep',
		dataType: 'json',
		type: 'post',
		success: function(res) {

			// 그래프 데이터 추출
			var xData = ['x',]; // X축 데이터
			var minData = ['Min']; // 'Min' 선의 데이터
			var maxData = ['Max']; // 'Max' 선의 데이터
			var avgData = ['Avg']; // 'Avg' 선의 데이터


			// 서버에서 받아온 res 데이터를 이용하여 그래프 데이터 생성
			for (var i = 0; i < res.length; i++) {
				var inputDate = res[i].input_date;
				var minTime = res[i].min_time;
				var maxTime = res[i].max_time;
				var avgTime = res[i].avg_time;

				// X축 데이터에 날짜 정보 추가
				var date = new Date(inputDate);
				xData.push(date.toISOString().substring(0, 10));

				// 'Min' 선의 데이터 추가
				minData.push(minTime);

				// 'Max' 선의 데이터 추가
				maxData.push(maxTime);

				// 'Avg' 선의 데이터 추가
				avgData.push(avgTime);
			}

			var min_time = 0;
			var max_time = 0;
			var avg_time = 0;
			var all_time = 0;
			
			
			// 분석시간 표에 넣어줄 데이터 재생성
			for (var i = 1; i < minData.length; i++) {
				min_time += minData[i];
				max_time += maxData[i];
				avg_time += avgData[i];
				all_time = min_time + max_time;
			}

			var minTimeElement = document.getElementById('minTime'); // 출력을 원하는 HTML 요소의 ID를 지정
			minTimeElement.innerText = (min_time / (minData.length-1)).toFixed(3) + "/sec";
			
			var maxTimeElement = document.getElementById('maxTime'); // 출력을 원하는 HTML 요소의 ID를 지정
			maxTimeElement.innerText = (max_time / (minData.length-1)).toFixed(3) + "/sec";
			
			var avgTimeElement = document.getElementById('avgTime'); // 출력을 원하는 HTML 요소의 ID를 지정
			avgTimeElement.innerText = (avg_time / (minData.length-1)).toFixed(3) + "/sec";
			
			var avgTimeElement = document.getElementById('middleTime'); // 출력을 원하는 HTML 요소의 ID를 지정
			avgTimeElement.innerText = (all_time / ((minData.length-1) * 2)).toFixed(3) + "/sec";


			// 그래프 생성
			var chart = c3.generate({
				bindto: "#c3chart_zoom",
				data: {
					x: 'x',
					columns: [
						xData,
						minData,
						maxData,
						avgData
					],
					colors: {
						Min: '#5969ff',
						Max: '#ff4646',
						Avg: '#00b36b'
					},
					types: {
						Min: 'line',
						Max: 'line',
						Avg: 'line'
					}
				},
				zoom: {
					enabled: true
				},
				axis: {
					x: {
						type: 'timeseries',
						tick: {
							format: '%Y-%m-%d'
						}
					},
					y: {
						show: true
					}
				}
			});
		},
		error: function(error) {
			console.log(error);
		}
	});





	$(function() {

		if ($('#c3chart_area').length) {
			var chart = c3.generate({
				bindto: "#c3chart_area",
				data: {
					columns: [
						['data1', 300, 350, 300, 0, 0, 0],
						['data2', 130, 100, 140, 200, 150, 50]
					],
					types: {
						data1: 'area',
						data2: 'area-spline'
					},
					colors: {
						data1: '#5969ff',
						data2: '#ff407b',

					}

				},
				axis: {

					y: {
						show: true




					},
					x: {
						show: true
					}
				}

			});
		}


		if ($('#c3chart_spline').length) {
			var chart = c3.generate({
				bindto: "#c3chart_spline",
				data: {
					columns: [
						['data1', 30, 200, 100, 400, 150, 250],
						['data2', 130, 100, 140, 200, 150, 50]
					],
					type: 'spline',
					colors: {
						data1: '#5969ff',
						data2: '#ff407b',

					}
				},
				axis: {
					y: {
						show: true,


					},
					x: {
						show: true,
					}
				}
			});
		}

		if ($('#c3chart_zoom').length) {
			var chart = c3.generate({
				bindto: "#c3chart_zoom",
				data: {
					columns: [
						['Min', 0.3, 0.21, 1.11, 0.56, 0.77, 1.3, 1.5, 1.92, 0.31, 1.41, 0.35],
						['Max', 1.1, 1.21, 1.32, 1.43, 1.54, 1.65, 1.76, 1.85, 1.98, 1.64, 0.99],
						['Avg', 0.65, 0.6, 1.2, 0.8, 0.9, 1.0, 1.45, 1.65, 1.87, 1.11, 0.64]
					],
					colors: {
						Min: '#5969ff'
					}
				},
				zoom: {
					enabled: true
				},
				axis: {
					y: {
						show: true,
					},
					x: {
						show: true,
					}
				}

			});
		}


		if ($('#c3chart_scatter').length) {
			var chart = c3.generate({
				bindto: "#c3chart_scatter",
				data: {
					xs: {
						setosa: 'setosa_x',
						versicolor: 'versicolor_x',
					},
					// iris data from R
					columns: [
						["setosa_x", 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1, 3.7, 3.4, 3.0, 3.0, 4.0, 4.4, 3.9, 3.5, 3.8, 3.8, 3.4, 3.7, 3.6, 3.3, 3.4, 3.0, 3.4, 3.5, 3.4, 3.2, 3.1, 3.4, 4.1, 4.2, 3.1, 3.2, 3.5, 3.6, 3.0, 3.4, 3.5, 2.3, 3.2, 3.5, 3.8, 3.0, 3.8, 3.2, 3.7, 3.3],
						["versicolor_x", 3.2, 3.2, 3.1, 2.3, 2.8, 2.8, 3.3, 2.4, 2.9, 2.7, 2.0, 3.0, 2.2, 2.9, 2.9, 3.1, 3.0, 2.7, 2.2, 2.5, 3.2, 2.8, 2.5, 2.8, 2.9, 3.0, 2.8, 3.0, 2.9, 2.6, 2.4, 2.4, 2.7, 2.7, 3.0, 3.4, 3.1, 2.3, 3.0, 2.5, 2.6, 3.0, 2.6, 2.3, 2.7, 3.0, 2.9, 2.9, 2.5, 2.8],
						["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
						["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
					],
					type: 'scatter',
					colors: {
						setosa: '#5969ff',
						versicolor: '#ff407b',

					}
				},
				axis: {
					y: {
						show: true,


					},
					x: {
						show: true,
					}
				}
			});
			setTimeout(function() {
				chart.load({
					xs: {
						virginica: 'virginica_x'
					},
					columns: [
						["virginica_x", 3.3, 2.7, 3.0, 2.9, 3.0, 3.0, 2.5, 2.9, 2.5, 3.6, 3.2, 2.7, 3.0, 2.5, 2.8, 3.2, 3.0, 3.8, 2.6, 2.2, 3.2, 2.8, 2.8, 2.7, 3.3, 3.2, 2.8, 3.0, 2.8, 3.0, 2.8, 3.8, 2.8, 2.8, 2.6, 3.0, 3.4, 3.1, 3.0, 3.1, 3.1, 3.1, 2.7, 3.2, 3.3, 3.0, 2.5, 3.0, 3.4, 3.0],
						["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
					]
				});
			}, 1000);
			setTimeout(function() {
				chart.unload({
					ids: 'setosa'
				});
			}, 2000);
			setTimeout(function() {
				chart.load({
					columns: [
						["virginica", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
					]
				});
			}, 3000);
		}


		if ($('#c3chart_stacked').length) {
			var chart = c3.generate({
				bindto: "#c3chart_stacked",

				data: {
					columns: [
						['data1', 130, 200, 320, 400, 530, 750],
						['data2', -130, 10, 130, 200, 150, 250],
						['data3', -130, -50, -10, -200, -250, -150]
					],
					type: 'bar',
					groups: [
						['data1', 'data2', 'data3']
					],
					order: 'desc', // stack order by sum of values descendantly. this is default.
					//      order: 'asc'  // stack order by sum of values ascendantly.
					//      order: null   // stack order by data definition.

					colors: {
						data1: '#5969ff',
						data2: '#ff407b',
						data3: '#64ced3'

					}
				},
				axis: {
					y: {
						show: true,


					},
					x: {
						show: true,
					}
				},
				grid: {
					y: {
						lines: [{ value: 0 }]
					}
				}
			});
			setTimeout(function() {
				chart.load({
					columns: [
						['data4', 1200, 1300, 1450, 1600, 1520, 1820],
					]
				});
			}, 1000);
			setTimeout(function() {
				chart.load({
					columns: [
						['data5', 200, 300, 450, 600, 520, 820],
					]
				});
			}, 2000);
			setTimeout(function() {
				chart.groups([
					['data1', 'data2', 'data3', 'data4', 'data5']
				])
			}, 3000);
		}


		// JavaScript
		$(document).ready(function() {
			$.ajax({
				url: 'getHealth',
				dataType: 'json',
				type: 'post',
				success: function(res) {
					// 데이터 가공
					var dates = [];
					var bp_cnts = [];
					var bs_cnts = [];

					for (var i = 0; i < res.length; i++) {
						var data = res[i];
						var date = new Date(data.input_date); // input_date를 Date 객체로 변환
						var bp_cnt = data.bp_cnt;
						var bs_cnt = data.bs_cnt;

						dates.push(date);
						bp_cnts.push(bp_cnt);
						bs_cnts.push(bs_cnt);
					}

					// 그래프 그리기
					var chart = c3.generate({
						bindto: "#c3chart_combine",
						data: {
							x: 'x',
							columns: [
								['x'].concat(dates), // x축 데이터
								['bp_cnt'].concat(bp_cnts), // bp_cnt 데이터
								['bs_cnt'].concat(bs_cnts) // bs_cnt 데이터
							],
							type: 'bar',

							colors: {
								bp_cnt: '#F05565',
								bs_cnt: '#5EFA28'
							}
						},
						zoom: {
							enabled: true
						},
						axis: {
							x: {
								type: 'timeseries',
								tick: {
									format: '%Y-%m-%d', // x축 날짜 형식 지정
									fit: true // 눈금 간격을 균등하게 설정
								}
							},
							y: {
								show: true
							}
						}
					});
				},
				error: function(error) {
					console.log(error);
				}
			});
		});



		// 분석 중 오류 발생 사용자 현황 그래프 영역
		if ($('#c3chart_pie1').length) {
			var chart = c3.generate({
				bindto: "#c3chart_pie1",
				data: {
					columns: [
						['정상 분석', 0.92],
						['분류 불가', 0.08]
					],
					type: 'pie',

					colors: {
						data1: '#007BFF',
						data2: '#AAAAAA'


					}
				},
				pie: {
					label: {
						format: function(value, ratio, id) {
							return d3.format('.0%')(value);
						}
					}
				}
			});
		}

		// Deep 분석 오류 유형
		if ($('#c3chart_pie2').length) {
			var chart = c3.generate({
				bindto: "#c3chart_pie2",
				data: {
					columns: [
						['정상분석', 0.85],
						['방향반전', 0.03],
						['신호불량', 0.05],
						['판정불가', 0.07]
					],
					type: 'pie',

					colors: {
						정상분석 : '#6C96FF',
						방향반전 : '#6756E8',
						신호불량 : '#2E7D32',
						판정불가 : '#FF825E',
					}
				},
				pie: {
					label: {
						format: function(value, ratio, id) {
							return d3.format('.0%')(value);
						}
					}
				}
			});

		}



		if ($('#c3chart_gauge').length) {
			var chart = c3.generate({
				bindto: "#c3chart_gauge",
				data: {
					columns: [
						['data1', 91.4]

					],
					type: 'gauge',
					onclick: function(d, i) { console.log("onclick", d, i); },
					onmouseover: function(d, i) { console.log("onmouseover", d, i); },
					onmouseout: function(d, i) { console.log("onmouseout", d, i); },
					colors: {
						data1: '#5969ff',
						data2: '#ff407b',
						data3: '#25d5f2',
						data4: '#ffc750',
						data5: '#2ec551',
						data6: '#1ba3b9',

					}
				},
				gauge: {
					//        label: {
					//            format: function(value, ratio) {
					//                return value;
					//            },
					//            show: false // to turn off the min/max labels.
					//        },
					//    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
					//    max: 100, // 100 is default
					//    units: ' %',
					//    width: 39 // for adjusting arc thickness
				},

				size: {
					height: 320
				}
			});



		}


	});

})(window, document, window.jQuery);