�	�r.�U��?�r.�U��?!�r.�U��?	s���@s���@!s���@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�r.�U��?�(�ޥ?A��Tގp�?Yt`9B�?*	U-��WT@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapK�R��%�?!���*�}A@)+����:�?1^�1hr=@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat�&�|��?!����;@)t	�ޒ?1���sn�6@:Preprocessing2U
Iterator::Model::ParallelMapV2���ދ/�?!,S]m/@)���ދ/�?1,S]m/@:Preprocessing2F
Iterator::Model]Ot]���?!����>@)&�"�dT�?17�9Xf.@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�e6Ȭ?!�9EU�EQ@)����cu?1r"���@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice~T�~O�s?![�Ƶg�@)~T�~O�s?1[�Ƶg�@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorg&�5�p?!����(@)g&�5�p?1����(@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 7.7% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s8.1 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9s���@I�~d� W@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�(�ޥ?�(�ޥ?!�(�ޥ?      ��!       "      ��!       *      ��!       2	��Tގp�?��Tގp�?!��Tގp�?:      ��!       B      ��!       J	t`9B�?t`9B�?!t`9B�?R      ��!       Z	t`9B�?t`9B�?!t`9B�?b      ��!       JCPU_ONLYYs���@b q�~d� W@Y      Y@q������#@"�	
both�Your program is MODERATELY input-bound because 7.7% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nomoderate"s8.1 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.2no:
Refer to the TF2 Profiler FAQ2"CPU: B 