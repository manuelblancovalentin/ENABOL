	�2ı.n�?�2ı.n�?!�2ı.n�?	tD���6@tD���6@!tD���6@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�2ı.n�?Ș����?Al%t��Y�?Yi��I�?*	sh��|�_@2F
Iterator::Model=`2�C�?!8�v0I@)�w�~�~�?1)�=;@:Preprocessing2U
Iterator::Model::ParallelMapV2������?!F��H7@)������?1F��H7@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap؂�C �?!�E�۸�8@)�&��d�?1���nU�1@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeaty7R�H�?!�d?Z4@)��j�=�?1 ��˧81@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[1]::TensorSlices�m�B<�?!Ҳ�=@)s�m�B<�?1Ҳ�=@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip��Y�N�?!��}��H@)ap��/w?1f_��j�@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorf���,p?!��ļ	@)f���,p?1��ļ	@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 22.9% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2t12.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9tD���6@I�A��FS@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	Ș����?Ș����?!Ș����?      ��!       "      ��!       *      ��!       2	l%t��Y�?l%t��Y�?!l%t��Y�?:      ��!       B      ��!       J	i��I�?i��I�?!i��I�?R      ��!       Z	i��I�?i��I�?!i��I�?b      ��!       JCPU_ONLYYtD���6@b q�A��FS@